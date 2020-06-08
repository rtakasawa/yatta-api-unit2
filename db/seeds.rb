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
  User.create( name: "user_#{n + 1}",
               email: "user_#{n + 1}@example.com",
               password: "password",
               password_confirmation: "password")
end

# material作成
User.all.each do |user|
  30.times do |n|
    title = Faker::Book.title
    author = Faker::Sports::Football.player
    category = rand(4)
    path = Faker::Internet.url
    note = Faker::JapaneseMedia::OnePiece.akuma_no_mi
    user.materials.create(title: title,
                          author: author,
                          category: category,
                          path: path,
                          note: note,
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
Material.all.each do |material|
  30.times do |n|
    start = rand(100)
    end_id = rand(200)
    content = Faker::JapaneseMedia::OnePiece.character
    status = 0
    material.works.create(start: start,
                          end: end_id,
                          content: content,
                          status: status,
                          material_id: material.id)
  end
end