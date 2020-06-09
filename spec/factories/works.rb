FactoryBot.define do
  factory :work do
    id { 1 }
    start { "1" }
    finish { "10" }
    content { "難しい" }
    status { "incomplete" }
    association :material
  end
  factory :second_work, class: Work do
    id { 2 }
    start { "1-1" }
    finish { "1-10" }
    content { "復習必要" }
    status { "complete" }
    association :material
  end
  factory :third_work, class: Work do
    id { 3 }
    start { "１" }
    finish { "１００" }
    content { "よくできた" }
    status { "incomplete" }
    association :material
  end
end