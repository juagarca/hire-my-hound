# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting users and dogs"
Dog.destroy_all
User.destroy_all


puts "Creating users and saving them"
users = []
10.times do
  e = [*('a'..'z')].sample(4).join+"@email.com"
  user = User.new(email: e, password: "123456", address: "London")
  user.save!
  users << user
end

puts "Creating dogs"
dogs = []
25.times do
  dog = Dog.new(name: [*('a'..'z')].sample(5).join, age: 5, breed: "Dachshund")
  dogs << dog
end

puts "Adding dogs to owners and saving them"
dogs.each do |dog|
  dog.user = users[rand(0..9)]
  dog.save!
end

puts "Finished"
