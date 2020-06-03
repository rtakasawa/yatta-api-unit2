FactoryBot.define do
  factory :material do
    title { "MyString" }
    author { "MyString" }
    category { 1 }
    path { "MyText" }
    note { "MyText" }
    user_references { "MyString" }
  end
end