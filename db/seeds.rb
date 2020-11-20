require 'date'

puts "Deleting users and dogs"
Booking.destroy_all
Dog.destroy_all
User.destroy_all

user_names = [["Anne", "De Joly"], ["Andre", "Ferrer"], ["Jakob", "Bethmann"], ["Sarah", "O'Grady"], ["Piotr", "Damer"]]

addresses = [["President House, King Square, London, EC1V 8DD"],
            ["180 Ashley Gardens, Emery Hill Street, London"],
            ["40 Ufford St, South Bank, London SE1 8LD"],
            ["14-1 Ruby St, Manchester"],
            ["25 Church St, Manchester M4 1PE"]]
dob = Date.today - 10000

lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
dog_lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

puts "Beginning user creation"

iterator = 0
(user_names.length).times do |i|
  email = "#{user_names[iterator][0]}@lewagon.com"
  new_user = User.new
  new_user.address = addresses[iterator][0]
  new_user.email = email
  new_user.first_name = user_names[iterator][0]
  new_user.last_name = user_names[iterator][1]
  new_user.bio = lorem
  new_user.date_of_birth = dob
  new_user.password = "password"
  new_user.save!
  puts "User generated, associating dogs"
  3.times do |j|
    new_dog = Dog.new
    new_dog.name = Faker::Creature::Dog.name
    new_dog.age = rand(15)
    new_dog.breed = Faker::Creature::Dog.breed
    new_dog.user = new_user
    new_dog.hourly_rate = rand(5..50)
    new_dog.insurance = true if (rand(1..2) == 2)
    new_dog.photo.attach(io: File.open(File.join(Rails.root,'app/assets/images/dog_placeholder.jpg')), filename: 'dog.jpg', content_type: 'image/jpg')
    new_dog.save!
  end
  puts "User generated with 3 dogs"
  iterator += 1
end


puts "All dogs and users made"

