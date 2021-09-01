# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'csv'
require 'open-uri'

Watering.delete_all
if Watering.count.zero?
  puts "All waterings have been destroyed"
else
  puts "error deleting waterings"
end

Plant.delete_all
if Plant.count.zero?
  puts "All plants have been destroyed"
else
  puts "error deleting plants"
end

Specie.delete_all
if Specie.count.zero?
  puts "All species have been destroyed"
else
  puts "error deleting species"
end

Eplant.delete_all
if Eplant.count.zero?
  puts "All Eplants have been deleted"
else
  puts "error deleting Eplants"
end

User.delete_all
if User.count.zero?
  puts "All users have been destroy"
else
  puts "error deleting users"
end

# species

exposures = ['sun', 'half', 'shaddow']
species_search = ['cactus', 'dahlia', 'jasmine', 'Safari Sunset Aloe', 'geranium caliente', 'ficus',
                  'Bougainvillea', 'azalea', 'Painted Lady Echeveria', 'Ruffles Echeveria',
                  'Rojo Congo Philodendron', 'Elephant Ear', 'Southern Splendor Cordyline',
                  'Bunny Ears', 'Yellow Groove Bamboo', 'Picturata Aucuba', 'Pink Parade Camellia',
                  'Cherie Hibiscus', 'Pindo Palm', 'White Swan Coneflower']

species = []

species_search.each do |specie|
  scraper = Scraper.new
  attributes = scraper.scrap(specie)
  new_specie = Specie.new(attributes)
  new_specie.exposure = exposures.sample
  new_specie.watering_frequency = rand(2..10)
  new_specie.save
  species << new_specie
end

# specie1 = Specie.create(
#   name: 'orchidee',
#   exposure: exposures.sample,
#   watering_frequency: rand(0..30),
#   description: "Le chanvre est une des premières plantes domestiquées par l'homme, au Néolithique, probablement en Asie. Il a ensuite accompagné migrations et conquêtes pour se répandre sur tous les continents. Jadis, le Cannabis, était considéré comme une plante magique associée aux pratiques magiques. L'usage rituel du cannabis comme psychotrope est attesté il y a 2500 ans à Jirzankal, Chine."
# )

# specie2 = Specie.create(
#   name: 'ortie',
#   exposure: exposures.sample,
#   watering_frequency: rand(0..30),
#   description: "Le chanvre est une des premières plantes domestiquées par l'homme, au Néolithique, probablement en Asie. Il a ensuite accompagné migrations et conquêtes pour se répandre sur tous les continents. Jadis, le Cannabis, était considéré comme une plante magique associée aux pratiques magiques. L'usage rituel du cannabis comme psychotrope est attesté il y a 2500 ans à Jirzankal, Chine."
# )

# specie3 = Specie.create(
#   name: 'jasmin',
#   exposure: exposures.sample,
#   watering_frequency: rand(0..30),
#   description: "Le chanvre est une des premières plantes domestiquées par l'homme, au Néolithique, probablement en Asie. Il a ensuite accompagné migrations et conquêtes pour se répandre sur tous les continents. Jadis, le Cannabis, était considéré comme une plante magique associée aux pratiques magiques. L'usage rituel du cannabis comme psychotrope est attesté il y a 2500 ans à Jirzankal, Chine."
# )

# specie4 = Specie.create(
#   name: 'rose',
#   exposure: exposures.sample,
#   watering_frequency: rand(0..30),
#   description: "Le chanvre est une des premières plantes domestiquées par l'homme, au Néolithique, probablement en Asie. Il a ensuite accompagné migrations et conquêtes pour se répandre sur tous les continents. Jadis, le Cannabis, était considéré comme une plante magique associée aux pratiques magiques. L'usage rituel du cannabis comme psychotrope est attesté il y a 2500 ans à Jirzankal, Chine."
# )

# specie5 = Specie.create(
#   name: 'petunia',
#   exposure: exposures.sample,
#   watering_frequency: rand(0..30),
#   description: "Le chanvre est une des premières plantes domestiquées par l'homme, au Néolithique, probablement en Asie. Il a ensuite accompagné migrations et conquêtes pour se répandre sur tous les continents. Jadis, le Cannabis, était considéré comme une plante magique associée aux pratiques magiques. L'usage rituel du cannabis comme psychotrope est attesté il y a 2500 ans à Jirzankal, Chine."
# )
# specie6 = Specie.create(
#   name: 'basilic',
#   exposure: exposures.sample,
#   watering_frequency: rand(0..30),
#   description: "Le chanvre est une des premières plantes domestiquées par l'homme, au Néolithique, probablement en Asie. Il a ensuite accompagné migrations et conquêtes pour se répandre sur tous les continents. Jadis, le Cannabis, était considéré comme une plante magique associée aux pratiques magiques. L'usage rituel du cannabis comme psychotrope est attesté il y a 2500 ans à Jirzankal, Chine."
# )
# specie7 = Specie.create(
#   name: 'mint',
#   exposure: exposures.sample,
#   watering_frequency: rand(0..30),
#   description: "Le chanvre est une des premières plantes domestiquées par l'homme, au Néolithique, probablement en Asie. Il a ensuite accompagné migrations et conquêtes pour se répandre sur tous les continents. Jadis, le Cannabis, était considéré comme une plante magique associée aux pratiques magiques. L'usage rituel du cannabis comme psychotrope est attesté il y a 2500 ans à Jirzankal, Chine."
# )
# specie8 = Specie.create(
#   name: 'margarita',
#   exposure: exposures.sample,
#   watering_frequency: rand(0..30),
#   description: "Le chanvre est une des premières plantes domestiquées par l'homme, au Néolithique, probablement en Asie. Il a ensuite accompagné migrations et conquêtes pour se répandre sur tous les continents. Jadis, le Cannabis, était considéré comme une plante magique associée aux pratiques magiques. L'usage rituel du cannabis comme psychotrope est attesté il y a 2500 ans à Jirzankal, Chine."
# )
# specie9 = Specie.create(
#   name: 'sunflower',
#   exposure: exposures.sample,
#   watering_frequency: rand(0..30),
#   description: "Le chanvre est une des premières plantes domestiquées par l'homme, au Néolithique, probablement en Asie. Il a ensuite accompagné migrations et conquêtes pour se répandre sur tous les continents. Jadis, le Cannabis, était considéré comme une plante magique associée aux pratiques magiques. L'usage rituel du cannabis comme psychotrope est attesté il y a 2500 ans à Jirzankal, Chine."
# )
# specie10 = Specie.create(
#   name: 'camelia',
#   exposure: exposures.sample,
#   watering_frequency: rand(0..30),
#   description: "Le chanvre est une des premières plantes domestiquées par l'homme, au Néolithique, probablement en Asie. Il a ensuite accompagné migrations et conquêtes pour se répandre sur tous les continents. Jadis, le Cannabis, était considéré comme une plante magique associée aux pratiques magiques. L'usage rituel du cannabis comme psychotrope est attesté il y a 2500 ans à Jirzankal, Chine."
# )

if Specie.count == species_search.size
  puts "#{species.size} species created"
else
  puts "error creating species"
end

# 4 users

user1 = User.create(
  email: 'thais@lewagon.fr',
  username: 'thaïsW',
  password: '123456',
  password_confirmation: '123456'
)
photo1 = URI.open("https://st4.depositphotos.com/13194036/25333/i/1600/depositphotos_253334960-stock-photo-sexy-young-woman-in-white.jpg")
user1.photo.attach(io: photo1, filename: "jardiniere.jpg", content_type: 'image/jpg')


user2 = User.create(
  email: 'adrien@lewagon.fr',
  username: 'adrïenW',
  password: '123456',
  password_confirmation: '123456'
)
photo2 = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSb8vtP5ykKZ0gm3D1TDOaCcfDtsNQtuAlI2swJV00yFHTeXPPsxoTdhZ_7ppELQQdsyrk&usqp=CAU")
user2.photo.attach(io: photo2, filename: "jardiniere.jpg", content_type: 'image/jpg')



user3 = User.create(
  email: 'rogerio@lewagon.fr',
  username: 'rogerioW',
  password: '123456',
  password_confirmation: '123456'
)
photo3 = URI.open("https://2.bp.blogspot.com/-jLaNDufIHts/V9Ht3RUdGDI/AAAAAAAADxA/Ts5ipmR4chwEnFDR5pAdIhFOJLRXwAEHgCLcB/s1600/guestpost16_adatseng05.jpg")
user3.photo.attach(io: photo3, filename: "jardiniere.jpg", content_type: 'image/jpg')


user4 = User.create(
  email: 'augustin@lewagon.fr',
  username: 'augustinW',
  password: '123456',
  password_confirmation: '123456'
)
photo4 = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc28QMcjpqPRltBVZ_mX6pRU-mkFKr8difo1fgu0apPwGx9BikMBPOw96GF2VZgx4zXHY&usqp=CAU")
user4.photo.attach(io: photo4, filename: "jardiniere.jpg", content_type: 'image/jpg')


users = [user1, user2, user3, user4]

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

eplant1.user = user1
eplant1.save
eplant2.user = user2
eplant2.save
eplant3.user = user3
eplant3.save
eplant4.user = user4
eplant4.save

if Eplant.count == 4
  puts "4 Eplants created"
else
  puts "error creating Eplants"
end

# 20 plants

exposure = %w[sun half shade]

20.times do
  plant = Plant.new(
    nickname: Faker::Games::Pokemon.name,
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
puts "xoxo, GossipGirl.."
