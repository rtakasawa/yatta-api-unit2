FactoryBot.define do
  factory :material do
    id { 1 }
    title { 'test1' }
    category { 'book' }
    path { 'http://example.com' }
    note { 'test_note1' }
    status { 'learning' }
    association :user
  end
  factory :second_material, class: Material do
    id { 2 }
    title { 'test2' }
    category { 'video' }
    path { 'http://example2.com' }
    note { 'test_note2' }
    status { 'complete' }
    association :user
  end
  factory :third_material, class: Material do
    id { 3 }
    title { 'test3' }
    category { 'web' }
    path { 'http://example3.com' }
    note { 'test_note3' }
    status { 'learning' }
    association :user
  end
  factory :fourth_material, class: Material do
    id { 4 }
    title { 'test4' }
    category { 'web' }
    path { 'http://example4.com' }
    note { 'test_note4' }
    status { 'learning' }
    association :user
  end
end
