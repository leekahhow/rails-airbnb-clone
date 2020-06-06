# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "destroying booking then pets"
Booking.destroy_all
Pet.destroy_all
"destroyed bookng followed by pets"

puts "Resetting Database. destroying region then category"
Region.destroy_all
Category.destroy_all
"destroyed region followed by category"

puts "Seeding Database Now"

puts "Now Seeding Regions"
# 1. Seeding Regions
central = Region.create(name: "Central")
north = Region.create(name: "North")
east = Region.create(name: "East")
west = Region.create(name: "West")
south = Region.create(name: "South")


puts "Now Seeding Categories"
# 2. Seeding Categories
cat = Category.create(animal_type: "Cat")
dog = Category.create(animal_type: "Dog")
rabbit = Category.create(animal_type: "Rabbit")
lizard = Category.create(animal_type: "Lizard")
fish = Category.create(animal_type: "Fish")
others = Category.create(animal_type: "Others")



puts "Now seeding users"
User.create(
  name: "prima",
  email: "primasuper@gmail.com",
  password: "123456",
  region: west,
  phone_number: "97333299"
)
User.create(
  name: "Powerful",
  email: "prize@gmail.com",
  password: "1234567",
  region: east,
  phone_number: "97533299"
)

User.create(
  name: "Tammy",
  email: "tammi@gmail.com",
  password: "12345678",
  region: central,
  phone_number: "97533290"
)



puts "Now Seeding Pets"
#3. Seeding Pets

file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

pet_1 = Pet.create(  name: "Jim",
  description: "Low key best animal to cuddle.",
  price_per_hour: 10,
  category: dog,
  user: User.last
)

pet_1.photo.attach(io: file, filename: 'newpet_1.png', content_type: 'image/png')

pet_2 = Pet.create(
  name: "Herbet",
  description: "A dope as animal.",
  price_per_hour: 13,
  category: cat,
  user: User.last
)

pet_3 = Pet.create(
  name: "Joker",
  description: "A dope as animal.",
  price_per_hour: 13,
  category: cat,
  user: User.all[1]
)



# pet_2.photo.attach(io: file, filename: 'newpet_2.png', content_type: 'image/png')



puts "Done Seeding"
