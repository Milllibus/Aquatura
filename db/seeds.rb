# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'csv'

Specie.delete_all
if Specie.count.zero?
  puts "All species have been destroy"
else
  puts "error deleting species"
end

User.delete_all
if User.count.zero?
  puts "All users have been destroy"
else
  puts "error deleting users"
end

Eplant.delete_all
if Eplant.count.zero?
  puts "All Eplants have been deleted"
else
  puts "error deleting Eplants"
end

Plant.delete_all
if Plant.count.zero?
  puts "All plants have been destroy"
else
  puts "error deleting plants"
end

Watering.delete_all
if Watering.count.zero?
  puts "All waterings have been destroy"
else
  puts "error deleting waterings"
end

# 10 species

exposures = ['sun', 'half', 'shaddow']

specie1 = Specie.create(
  name: 'orchidee',
  exposure: '-',
  watering_frequency: 1 / rand(0..30)
)

specie2 = Specie.create(
  name: 'ortie',
  exposure: '-',
  watering_frequency: 3
)

specie3 = Specie.create(
  name: 'jasmin',
  exposure: '-',
  watering_frequency: 4
)

specie4 = Specie.create(
  name: 'rose',
  exposure: '-',
  watering_frequency: 2
)

specie5 = Specie.create(
  name: 'petunia',
  exposure: '-',
  watering_frequency: 4
)
specie6 = Specie.create(
  name: 'basilic',
  exposure: '-',
  watering_frequency: 5
)
specie7 = Specie.create(
  name: 'mint',
  exposure: '-',
  watering_frequency: 4
)
specie8 = Specie.create(
  name: 'margarita',
  exposure: '-',
  watering_frequency: 3,
)
specie9 = Specie.create(
  name: 'sunflower',
  exposure: '-',
  watering_frequency: 3
)
specie10 = Specie.create(
  name: 'camelia',
  exposure: '-',
  watering_frequency: 3
)

if Specie.count == 10
  puts "10 species created"
else
  puts "error creating species"
end

species = [specie1, specie2, specie3, specie4, specie5, specie6, specie7, specie8, specie9, specie10]

# 4 users

user1 = User.create(
  email: 'thais@lewagon.fr',
  username: 'tahisW',
  password: '123456',
  password_confirmation: '123456'
)

user2 = User.create(
  email: 'adrien@lewagon.fr',
  username: 'adrienW',
  password: '123456',
  password_confirmation: '123456'
)

user3 = User.create(
  email: 'rogerio@lewagon.fr',
  username: 'rogerioW',
  password: '123456',
  password_confirmation: '123456'
)

user4 = User.create(
  email: 'augustin@lewagon.fr',
  username: 'augustinW',
  password: '123456',
  password_confirmation: '123456'
)

users = [user1, user2, user3, user4]

locations = ['155	Rue Commandant Caroline Aigle	13090	Aix-en-Provence', "7	Rue de l'Abbé Bremond	13090	Aix-en-Provence",
          "1 Rue Achille Emperaire	13090	Aix-en-Provence", "1	Rue des Alizés	13090	Aix-en-Provence",
          "6	Allée des Amandiers	13100	Aix-en-Provence", "8	Passage Agard	13100	Aix-en-Provence",
        "35	Chemin Albert Guigou	13290	Aix-en-Provence", "8	Traverse de l'Aigle d'Or	13100	Aix-en-Provence",
      "2	Place Aimé Gazel	13290	Aix-en-Provence", "2	Avenue Albert Baudoin	13090	Aix-en-Provence"]

n = 0

users.each do |user|
  user.address = locations[n]
  user.save
  n += 1
end

if User.count == 4
  puts "4 users created"
else
  puts "error creating users"
end

# 4 Eplants

eplant1 = Eplant.new(
  level: rand(0..100),
  nickname: 'lola'
)

eplant2 = Eplant.new(
  level: rand(0..100),
  nickname: 'patoche'
)

eplant3 = Eplant.new(
  level: rand(0..100),
  nickname: 'papi'
)

eplant4 = Eplant.new(
  level: rand(0..100),
  nickname: 'pikachu'
)

eplants = [eplant1, eplant2, eplant3, eplant4]

eplants.each do |eplant|
  eplant.user = users.sample
  eplant.save
end

if Eplant.count == 4
  puts "4 Eplants created"
else
  puts "error creating Eplants"
end

# 20 plants

exposure = ['sunny', 'half', 'shaddow']

20.times do
  plant = Plant.new(
    nickname: Faker::Name.name,
    exposure: exposure.sample
  )
  plant.user = users.sample
  plant.specie = species.sample
  plant.save
end

if Plant.count == 20
  puts "20 plants created"
else
  puts "error creating plants"
end

# Waterings ?
