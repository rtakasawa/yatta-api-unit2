require 'json'

class Qiita
  URL = 'https://qiita.com'.freeze

  # タイトルに検索キーワードが入っている記事をQiitaから取得
  # 記事の一覧を作成日時の降順で返ってくる
  def self.get(keyword)
    return '検索キーワードを入力してください' if keyword.size.zero?

    response = Faraday.new(url: URL).get do |req|
      req.url '/api/v2/items', page: 1, per_page: 100, query: "title:#{keyword}"
    end

    return response_success_action(response) if response.status == 200

    # IPアドレスごとに1時間に60回までリクエスト制限あり。60回以上リクエストした場合は下記となる
    if response.status == 403 && response.headers['rate-remaining'] == '0'
      return '1時間に60回リクエストしましたので、利用できません。一定時間後に利用できます。'
    end

    # エラーを出す。log/development.logにエラーログが残る
    raise "Charge failed. ErrCode: #{response.status}/ErrMessage: #{response.body}"
  end

  # Qiitaから返ってきたresponseのステータスが200であった場合
  def self.response_success_action(response)
    if response.body == '[]'
      '検索にヒットした記事がありませんでした'
    else
      json = JSON.parse(response.body)
      json.sort_by { |i| i['likes_count'] }.reverse.map do |item|
        { title: item['title'], url: item['url'], likes_count: item['likes_count'] }
      end.take(100)
    end
  end
end
