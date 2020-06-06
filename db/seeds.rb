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
    tag_first = Faker::JapaneseMedia::DragonBall.character
    tag_second = Faker::JapaneseMedia::DragonBall.character
    @material = user.materials.create(title: title,
                          author: author,
                          category: category,
                          path: path,
                          note: note,
                          user_id: user.id)
  end
end

Material.all.each do |material|
  tag_first = Faker::JapaneseMedia::DragonBall.character
  tag_second = Faker::JapaneseMedia::DragonBall.character
  material.tag_list.add(tag_first,tag_second)
  material.save
end

#
# # ユーザー作成
# 5.times do |n| User.create( name: "test_user_#{n + 1}",
#                             email: "test_user_#{n + 1}@gmail.com",
#                             password: "0000000",
#                             password_confirmation: "0000000") end
#
# # material作成
# User.all.each do |user|
#   5.times do |i|
#     user.materials.create(
#       title: "#{i}番目の教材",
#       author: "#{i}番目の作者",
#       category: 0,
#       path: "http://example#{i}.com",
#       note: "test_note#{i}",
#       user_id: user.id
#     )
#   end
# end
#
# User.all.each do |user|
#   5.times do |i|
#     user.materials.create(
#       title: "#{i}番目の教材",
#       author: "#{i}番目の作者",
#       category: 1,
#       path: "http://example#{i}.com",
#       note: "test_note#{i}",
#       user_id: user.id
#     )
#   end
# end
#
# User.all.each do |user|
#   5.times do |i|
#     user.materials.create(
#       title: "#{i}番目の教材",
#       author: "#{i}番目の作者",
#       category: 2,
#       path: "http://example#{i}.com",
#       note: "test_note#{i}",
#       user_id: user.id
#     )
#   end
# end
#
# User.all.each do |user|
#   5.times do |i|
#     user.materials.create(
#       title: "#{i}番目の教材",
#       author: "#{i}番目の作者",
#       category: 3,
#       path: "http://example#{i}.com",
#       note: "test_note#{i}",
#       user_id: user.id
#     )
#   end
# end
#
# Material.all.each do |material|
#   material.tag_list[]
#
#
# end
#
#
#
# # #label作成
# # Label.create([
# #                {title: "work"},
# #                {title: "private"},
# #                {title: "other"}
# #              ])
# #
# # #taskとlabelの紐付け
# # Task.all.sample(50).each do |task|
# #   label = Label.first
# #   task.task_to_labels.create(task_id: task.id, label_id: label.id)
# # end
# #
# # Task.all.sample(50).each do |task|
# #   label = Label.second
# #   task.task_to_labels.create(task_id: task.id, label_id: label.id)
# # end
# #
# # Task.all.sample(50).each do |task|
# #   label = Label.third
# #   task.task_to_labels.create(task_id: task.id, label_id: label.id)
# # end