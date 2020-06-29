class Book
  def self.get(keyword)
    items = RakutenWebService::Books::Book.search(title: keyword)
    # Kaminariのページネーションのため、配列に入れる
    # allとすることで、全ての検索結果を取得できる
    items.all.map do |item|
      item
    end
  end
end