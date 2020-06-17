FactoryBot.define do
  factory :work do
    id { 1 }
    start { "1" }
    finish { "10" }
    content { "難しい" }
    do_on { Date.today }
    association :material
  end
  factory :second_work, class: Work do
    id { 2 }
    start { "1-1" }
    finish { "1-10" }
    content { "復習必要" }
    do_on { Date.today-1 }
    association :material
  end
  factory :third_work, class: Work do
    id { 3 }
    start { "１" }
    finish { "１００" }
    content { "よくできた" }
    do_on { Date.today-2 }
    association :material
  end
  factory :fourth_work, class: Work do
    id { 4 }
    start { "１" }
    finish { "１００" }
    content { "よくできた" }
    do_on { Date.today-2 }
    association :material
  end
end