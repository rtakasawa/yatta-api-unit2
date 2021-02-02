require 'json'

class Udemy
  URL = 'https://www.udemy.com/api-2.0/courses/?page_size=100&search='.freeze

  attr_reader :result
  def initialize(keyword)
    @result = self.get(keyword)
  end

  def get(keyword)
    return '検索キーワードを入力してください' if keyword.size.zero?

    search_url = "#{URL}#{keyword}&language=ja"

    response = Faraday.new(url: search_url) do |req|
      req.basic_auth(ENV['UDEMY_CLIENT_ID'], ENV['UDEMY_CLIENT_SECRET'])
      req.adapter :net_http
    end
    get_response = response.get

    return response_success_action(get_response) if get_response.status == 200

    # statusが200以外の場合、エラーを出す。log/development.logにエラーログが残る
    raise "Charge failed. ErrCode: #{get_response.status}/ErrMessage: #{get_response.body}"
  end

  # get_responseのstatusが200の場合
  def response_success_action(get_response)
    json = JSON.parse(get_response.body)
    if json["count"].zero?
      '検索にヒットした講座がありませんでした'
    else
      json["results"].map do |item|
        { title: item["title"], image: item["image_240x135"] }
      end.take(100)
    end
  end
end
