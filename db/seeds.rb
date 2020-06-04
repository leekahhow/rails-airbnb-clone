# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Resetting Database. Destroying all"
Region.destroy_all
Category.destroy_all

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

puts "Now Seeding Pets"
# 3. Seeding Pets
Pet.create(
  name: "Herbet",
  description: "A dope as animal.",
  price_per_hour: 13,
  category: cat,
  user: User.all[1]
)

Pet.create(
  name: "Jim",
  description: "Low key best animal to cuddle.",
  price_per_hour: 10,
  category: dog,
  user: User.last
)
puts "Now seeding super prima"
User.create(
  name: "prima",
  email: "primasuper@gmail.com",
  password: "123456",
  region: west,
  phone_number: "97333299"
)


puts "Done Seeding"
