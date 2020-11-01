class Book
  def self.get(keyword)
    return '検索キーワードは２文字以上入力してください' if keyword.size == 1
    return '検索キーワードを入力してください' if keyword.size.zero?

    # Kaminariのページネーションのため、配列に入れる
    # allとすることで、全ての検索結果を取得できる
    items = RakutenWebService::Books::Book.search(title: keyword).all.map { |item| item }
    items.presence || '検索にヒットするものがありませんでした'
  end
end
