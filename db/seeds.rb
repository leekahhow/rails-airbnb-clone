# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
puts "Resetting Database."

puts "destroying booking then pets"
Booking.destroy_all
Pet.destroy_all
"destroyed bookng followed by pets"

puts "destroying region then category"
Region.destroy_all
Category.destroy_all
"destroyed region followed by category"

puts "destroying reviews then users"
Review.destroy_all
User.destroy_all
"destroyed reviews followed by users"

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
  name: "Sam",
  email: "sam@petpet.us",
  password: "123456",
  region: west,
  phone_number: "97333299"
)
User.create(
  name: "Jon",
  email: "jon@petpet.us",
  password: "123456",
  region: east,
  phone_number: "97533299"
)

User.create(
  name: "Joohee",
  email: "joohee@petpet.us",
  password: "123456",
  region: central,
  phone_number: "97533290"
)

User.create(
  name: "Kahhow",
  email: "kahhow@petpet.us",
  password: "123456",
  region: north,
  phone_number: "97533291"
)


puts "Now Seeding Pets"
#3. Seeding Pets

file = open('./db/images/pet1.jpg')
file_1 = open('./db/images/pet2.jpg')
file_2 = open('./db/images/pet3.jpg')
file_3 = open('./db/images/pet4.jpg')
file_4 = open('./db/images/pet5.jpg')
file_5 = open('./db/images/pet6.jpg')
file_6 = open('./db/images/pet7.jpg')
file_7 = open('./db/images/pet8.jpg')
file_8 = open('./db/images/pet9.jpg')
file_9 = open('./db/images/pet10.jpg')
file_10 = open('./db/images/pet11.jpg')
file_11 = open('./db/images/pet12.jpg')
file_12 = open('./db/images/pet13.jpg')
file_13 = open('./db/images/pet14.jpg')
file_14 = open('./db/images/pet15.jpg')
file_15 = open('./db/images/pet16.jpg')
file_16 = open('./db/images/pet17.jpg')
file_17 = open('./db/images/pet18.jpg')


pet_1 = Pet.create(  name: "Jim",
  description: "Gorgeous Welsh Corgi - kow key best animal to cuddle.",
  price_per_hour: 15,
  category: dog,
  user: User.last
)

pet_1.photo.attach(io: file, filename: 'jim.png', content_type: 'image/png')

pet_2 = Pet.create(
  name: "Herbet",
  description: "A cat with a personality that is better than your fantasy. Herbet loves sorbets and a human to bully.",
  price_per_hour: 10,
  category: cat,
  user: User.last
)

pet_2.photo.attach(io: file_1, filename: 'herbet.png', content_type: 'image/png')


pet_3 = Pet.create(
  name: "Joker",
  description: "The fiesty princess that has a mood that is as unpredictable as the temperature of an East Coast Winter.",
  price_per_hour: 2,
  category: cat,
  user: User.all[1]
)

pet_3.photo.attach(io: file_2, filename: 'joker.png', content_type: 'image/png')


pet_4 = Pet.create(
  name: "Charizard",
  description: "Fancy a bearded dragon as a pet? Scaly, friendly, he is as close to a pokemon as you can be.",
  price_per_hour: 50,
  category: lizard,
  user: User.all[1]
)

pet_4.photo.attach(io: file_3, filename: 'charizard.png', content_type: 'image/png')

pet_5 = Pet.create(
  name: "Tomato Lord",
  description: "As big as a dog, as red as tomato5. He will brighten up your day and make you believe in love again.",
  price_per_hour: 30,
  category: lizard,
  user: User.all[1]
)

pet_5.photo.attach(io: file_4, filename: 'tomato_lord.png', content_type: 'image/png')

pet_6 = Pet.create(
  name: "Golden Girl",
  description: "If you told me she were Ariel, I would believe. She is nothing less than a Disney princess. Tank comes included.",
  price_per_hour: 100,
  category: fish,
  user: User.all[1]
)

pet_6.photo.attach(io: file_5, filename: 'tomato_lord.png', content_type: 'image/png')

pet_7 = Pet.create(
  name: "Bugs Bunny",
  description: "Less annoying than the one in Looney Tunes. Abandoned as a child, sucker for hugs.",
  price_per_hour: 100,
  category: rabbit,
  user: User.all[1]
)

pet_7.photo.attach(io: file_6, filename: 'bugs_bunny.png', content_type: 'image/png')

pet_8 = Pet.create(
  name: "Lucas",
  description: "Want something furry with twice the number of legs as dogs or cats? I swear I saw him eat a tiny sparrow the other day.",
  price_per_hour: 100,
  category: others,
  user: User.all[1]
)

pet_8.photo.attach(io: file_7, filename: 'lucas.png', content_type: 'image/png')

pet_9 = Pet.create(
  name: "Kentucky",
  description: "Kentucky apparently became famous for killing a women who tried to steal eggs from his wife. Protective, loyal, he is the ideal man.",
  price_per_hour: 100,
  category: others,
  user: User.all[1]
)

pet_9.photo.attach(io: file_8, filename: 'kentucky.png', content_type: 'image/png')

pet_10 = Pet.create(
  name: "Honey Bunny",
  description: "No money, no honey. He eats only organic carrots and not random trash from Trader Joe's. Atas, proud and fat.",
  price_per_hour: 100,
  category: rabbit,
  user: User.all[1]
)

pet_10.photo.attach(io: file_9, filename: 'honeybunny.png', content_type: 'image/png')


pet_11 = Pet.create(
  name: "Death Star",
  description: "As sweet as honey stars",
  price_per_hour: 100,
  category: dog,
  user: User.all[1]
)

pet_11.photo.attach(io: file_10, filename: 'honeybunny.png', content_type: 'image/png')

pet_12 = Pet.create(
  name: "Mario",
  description: "He loves pizza and pasta. Also howls to the Italian flag",
  price_per_hour: 100,
  category: dog,
  user: User.all[1]
)

pet_12.photo.attach(io: file_11, filename: 'potato.png', content_type: 'image/png')


pet_13 = Pet.create(
  name: "Potato",
  description: "Loves the couch and always barks at you if you have fries.",
  price_per_hour: 100,
  category: dog,
  user: User.all[1]
)

pet_13.photo.attach(io: file_12, filename: 'potato.png', content_type: 'image/png')


pet_14 = Pet.create(
  name: "Jordan",
  description: "Chases a basketball and nothing else. Clearly has NBA dreams.",
  price_per_hour: 100,
  category: dog,
  user: User.all[1]
)

pet_14.photo.attach(io: file_13, filename: 'jordan.png', content_type: 'image/png')



pet_15 = Pet.create(
  name: "Jenny",
  description: "Previously under the care of a policewomen who died in service, Jenny is tender and gives you space even as you work from home.",
  price_per_hour: 100,
  category: dog,
  user: User.all[1]
)

pet_15.photo.attach(io: file_14, filename: 'jenny.png', content_type: 'image/png')



pet_16 = Pet.create(
  name: "Jack the Rapper",
  description: "Nothing gets him like good o' school hiphop beats. He actually dances to the breaks of the beats.",
  price_per_hour: 100,
  category: dog,
  user: User.all[1]
)

pet_16.photo.attach(io: file_15, filename: 'jack.png', content_type: 'image/png')


pet_17 = Pet.create(
  name: "Tommy",
  description: "He chases the wind and loves car rides. The latter is the best bribe.",
  price_per_hour: 100,
  category: dog,
  user: User.all[1]
)

pet_17.photo.attach(io: file_16, filename: 'tommy.png', content_type: 'image/png')


pet_18 = Pet.create(
  name: "Sleepy",
  description: "Sleepy lovely pup who can nap anytime, anywhere. Clearly a soldier in his past life.",
  price_per_hour: 100,
  category: dog,
  user: User.all[1]
)

pet_18.photo.attach(io: file_17, filename: 'sleepy.png', content_type: 'image/png')





# pet_2.photo.attach(io: file, filename: 'newpet_2.png', content_type: 'image/png')
puts "now creating booking"
first_booking = Booking.create!(pet: Pet.last, user: User.first, hours: 10, status: "approved", start_date: Date.today)
puts "booking created"


puts "now creating reviews"
first_Review = Review.create!(reviewable: first_booking, rating: 5, description: "Punctual, polite, pretty much perfect.")

puts "now creating reviews"
first_Review_user = Review.create!(reviewable: User.first, rating: 5, description: "Great glasses")

puts "reviews created"




puts "Done Seeding"
