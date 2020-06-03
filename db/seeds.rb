# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Resetting Database. Destorying all"
Region.destroy_all
Category.destroy_all

puts "Seeding Database Now"

puts "Now Seeding Regions"
# 1. Seeding Regions
Region.create(name: "Central")
Region.create(name: "North")
Region.create(name: "East")
Region.create(name: "West")
Region.create(name: "South")


puts "Now Seeding Categories"
# 2. Seeding Categories
Category.create(animal_type: "Cat")
Category.create(animal_type: "Dog")
Category.create(animal_type: "Rabbit")
Category.create(animal_type: "Lizard")
Category.create(animal_type: "Fish")
Category.create(animal_type: "Others")

puts "Done Seeding"
