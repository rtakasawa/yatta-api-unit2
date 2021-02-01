require 'json'

class Udemy
  URL = 'https://www.udemy.com/api-2.0/courses/?search='.freeze

  def initialize(keyword)
    @result = get(keyword)
  end

  def get(keyword)
    return '検索キーワードを入力してください' if keyword.size.zero?

    search_url = "#{URL}#{keyword}&language=ja"

    response = Faraday.new(url: search_url) do |req|
      req.basic_auth(ENV['UDEMY_CLIENT_ID'], ENV['UDEMY_CLIENT_SECRET'])
      req.adapter :net_http
    end
    JSON.parse(response.get.body)
  end
end
