require 'json'

class Qiita
  URL = 'https://qiita.com'.freeze

  # タイトルに検索キーワードが入っている記事をQiitaから取得
  # 記事の一覧を作成日時の降順で返ってくる
  def self.get(keyword)
    connection = Faraday.new(url: URL)
    response = connection.get do |req|
      req.url '/api/v2/items', page: 1, per_page: 100, query: "title:#{keyword}"
    end

    if response.status == 200
      # 検索ワードにヒットした記事があった場合
      if response.body == '[]'
        '検索にヒットした記事がありませんでした'
      else
        json = JSON.parse(response.body)
        json.sort_by { |i| i['likes_count'] }.reverse.map do |item|
          { title: item['title'], url: item['url'], likes_count: item['likes_count'] }
        end.take(100)
      end
      # Qiitaから返ってきた情報のステータスが200以外であった場合
      # IPアドレスごとに1時間に60回までリクエスト制限あり。60回以上リクエストした場合は下記となる
    elsif response.status == 403 && response.headers['rate-remaining'] == '0'
      '1時間に60回リクエストしましたので、利用できません。一定時間後に利用できます。'
    else
      # log/development.logにエラーログが残る
      raise "Charge failed. ErrCode: #{response.status}/ErrMessage: #{response.body}"
    end
  end

end
