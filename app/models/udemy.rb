require 'json'

class Udemy
  URL = 'https://www.udemy.com/api-2.0/courses/?language=ja&search='.freeze

  attr_reader :result
  def initialize(keyword)
    @result = self.get_result(keyword)
  end

  def get_result(keyword)
    return '検索キーワードを入力してください' if keyword.size.zero?
    search_url = URI.encode("#{URL}#{keyword}")

    get_response = self.api_auth(search_url).get
    return response_success_action(get_response) if get_response.success?

    # statusが200以外の場合、エラーを出す。log/development.logにエラーログが残る
    raise "Charge failed. ErrCode: #{get_response.status}/ErrMessage: #{get_response.body}"
  end

  def api_auth(search_url)
    @response = Faraday.new(url: search_url) do |req|
      req.basic_auth(ENV['UDEMY_CLIENT_ID'], ENV['UDEMY_CLIENT_SECRET'])
      req.adapter :net_http
    end
  end

  # get_responseのstatusが200の場合
  def response_success_action(get_response)
    udemy_info = JSON.parse(get_response.body)
    udemy_info_list = []

    return '検索にヒットする講座がありませんでした' if udemy_info["count"].zero?

    # Udemyのレスポンスは、デフォルトで12ページまでのため
    (1..12).each do |i|
      udemy_info["results"].each do |info|
        udemy_info_list.push(
          { title: info["title"],
            image: info["image_240x135"]
            })
      end
      break if udemy_info["next"].nil?
      udemy_info = JSON.parse(self.api_auth(udemy_info["next"]).get.body)
    end
    # なぜか講座が重複するため、重複削除
    udemy_info_list.uniq!
  end
end