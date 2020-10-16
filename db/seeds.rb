# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |e|
  User.create(email: "email#{e}@email.com", name: "name #{e}", password: "123456")
end

5.times do |e|
  Friendship.create(requester_id: 1, reciever_id: e+2, status: e.even?)
end