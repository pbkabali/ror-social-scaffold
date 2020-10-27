# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |e|
  User.create(email: "email#{e+1}@email.com", name: "name #{e+1}", password: "123456")
end

5.times do |e|
  Friendship.create(requester_id: 1, receiver_id: e+2, status: false)
end

5.times do |e|
  Post.create(user_id: e+1, content: "Content for post #{e+1}")
end

5.times do |e|
  Comment.create(user_id: e+1, post_id: e+1, content: "Content for comment #{e+1}")
end

5.times do |e|
  Like.create(user_id: e+1, post_id: e+1)
end

5.times do |e|
  Dislike.create(user_id: e+2, post_id: e+1)
end