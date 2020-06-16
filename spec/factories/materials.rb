FactoryBot.define do
  factory :material do
    id { 1 }
    title { "test1" }
    author { "test_author1" }
    category { "book" }
    path { "http://example.com" }
    note { "test_note1" }
    association :user
  end
  factory :second_material, class: Material do
    id { 2 }
    title { "test2" }
    author { "test_author2" }
    category { "video" }
    path { "http://example2.com" }
    note { "test_note2" }
    association :user
  end
  factory :third_material, class: Material do
    id { 3 }
    title { "test3" }
    author { "test_author3" }
    category { "web" }
    path { "http://example3.com" }
    note { "test_note3" }
    association :user
  end
end