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

Message.delete_all
if Message.count.zero?
  puts "All messages have been destroyed"
else
  puts "error deleting messages"
end

Chatroom.delete_all
if Chatroom.count.zero?
  puts "All chatrooms have been destroyed"
else
  puts "error deleting chatrooms"
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

exposures = ['sun', 'half', 'shaddow']
species_search = ['cactus', 'dahlia', 'jasmine', 'Safari Sunset Aloe', 'geranium caliente', 'Gold',
                  'Myrtle', 'azalea', 'Painted Lady Echeveria', 'Ruffles Echeveria',
                  'Rojo Congo Philodendron', 'Elephant Ear', 'Southern Splendor Cordyline',
                  'Agapanthus', 'Yellow Groove Bamboo', 'Picturata Aucuba', 'Pink Parade Camellia',
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

if Specie.count == species_search.size
  puts "#{species.size} species created"
else
  puts "error creating species"
end

species.each do |specie|
  new_chatroom = Chatroom.new(name: specie.name)
  new_chatroom.specie = specie
  new_chatroom.save
end

if Chatroom.count == species_search.size
  puts "#{species.size} chatrooms created"
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
photo1 = URI.open("https://res.cloudinary.com/dwhcqxkxh/image/upload/v1630572169/IMG-20210902-WA0002_vgjpgq.jpg")
user1.photo.attach(io: photo1, filename: "thais.jpg", content_type: 'image/jpg')

user2 = User.create(
  email: 'adrianna@lewagon.fr',
  username: 'adriannaW',
  password: '123456',
  password_confirmation: '123456'
)
photo2 = URI.open("https://res.cloudinary.com/dwhcqxkxh/image/upload/v1630572147/Image_d_iOS_1_knkoow.jpg")
user2.photo.attach(io: photo2, filename: "adrianna.jpg", content_type: 'image/jpg')



user3 = User.create(
  email: 'rogerio@lewagon.fr',
  username: 'rogerioW',
  password: '123456',
  password_confirmation: '123456'
)
photo3 = URI.open("https://res.cloudinary.com/dwhcqxkxh/image/upload/v1630572162/86491589_ydj8ij.jpg")
user3.photo.attach(io: photo3, filename: "rogerio.jpg", content_type: 'image/jpg')


user4 = User.create(
  email: 'augustin@lewagon.fr',
  username: 'augustinW',
  password: '123456',
  password_confirmation: '123456'
)
photo4 = URI.open("https://res.cloudinary.com/dwhcqxkxh/image/upload/v1630572065/6B4857E3-D2AA-466A-8C25-EDA8C7E05904_efgofp.jpg")
user4.photo.attach(io: photo4, filename: "augustin.jpg", content_type: 'image/jpg')

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
  count = 10
  10.times do
    watering = Watering.new
    watering.plant = plant
    if watering.save
      puts watering.created_at.to_date
      days = plant.specie.watering_frequency * count
      puts watering.created_at.to_date - days
      watering.created_at = ((watering.created_at).to_date - days).to_time
      count -= 1
      watering.save
    end
  end
end

if Plant.count == 20
  puts "20 plants created"
else
  puts "error creating plants"
end

if Watering.count == 200
  puts "200 waterings created"
else
  puts "error creating waterings"
end

puts "xoxo, GossipGirl.."
