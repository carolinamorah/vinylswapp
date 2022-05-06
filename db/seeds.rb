# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

code = "password"

User.create!(collectionist_name:"UserAdmin", email: 'admin@example.com', password: "password", role:1) 
AdminUser.create!(name:"UserAdmin", email: 'adminuser@example.com', password: code)

50.times do 
    User.create(
       email: "user#{rand(100..200)}@example.com",
       collectionist_name: Faker::Name.name,
       password: code)
end

# Géneros musicales
10.times do
   Category.create(
       genre: Faker::Music.genre
   ).distinct
end

60.times do  
    vinyl = Vinyl.create(
        title: Faker::Music.album,
        description: Faker::Lorem.sentence(word_count: 5),
        author: Faker::Music.
        user_id: users.sample
    )
    random = rand(1..10)
    vinyl.image.attach(io: File.open("app/assets/images/00"+"#{random}"+".jpg"), filename: "00"+"#{random}"+".jpg", content_type: 'image/jpg')
  end



