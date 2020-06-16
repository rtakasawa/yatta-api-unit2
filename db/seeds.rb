# Faker利用してのユーザー作成
# 30.times do |n|
#   # name = Faker::Name.name
#   # email = Faker::Internet.email
#   password = "password"
#   User.create!(name: name,
#                email: email,
#                password: password,
#                password_confirmation: password,
#                )
# end

# ユーザー作成
20.times do |n|
  User.create( name: "user",
               email: "#{n + 1}@example.com",
               password: "password",
               password_confirmation: "password")
end

# material作成
User.all.each do |user|
  20.times do |n|
    title = Faker::JapaneseMedia::OnePiece.character
    category = rand(4)
    path = Faker::Internet.url
    note = Faker::JapaneseMedia::OnePiece.akuma_no_mi
    status = rand(2)
    user.materials.create(title: title,
                          category: category,
                          path: path,
                          note: note,
                          status: status,
                          user_id: user.id)
  end
end

# タグ作成
Material.all.each do |material|
  tag_first = Faker::JapaneseMedia::DragonBall.character
  tag_second = Faker::JapaneseMedia::DragonBall.character
  material.tag_list.add(tag_first,tag_second)
  material.save
end

# 学習記録

require "date"

from = Date.parse("2020/01/01")
to   = Date.parse("2020/06/16")

Material.all.each do |material|
  20.times do |n|
    do_on = Random.rand(from .. to)
    start = rand(100)
    finish = rand(200)
    content = Faker::JapaneseMedia::OnePiece.quote
    material.works.create(do_on: do_on,
                          start: start,
                          finish: finish,
                          content: content,
                          material_id: material.id)
  end
end