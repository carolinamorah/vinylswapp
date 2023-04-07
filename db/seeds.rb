# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

code = "password"

# User.create!(collectionist_name:"UserAdmin", email: 'admin@example.com', password: "code", role:1) 
AdminUser.create!(email: 'adminuser@example.com', password: 'password', password_confirmation: 'password')

users = 60.times.map do 
    User.create(
      email: "user#{rand(100..200)}@example.com",
      collectionist_name: Faker::Name.name,
      password: code
    ).id
end

#Géneros musicales
existing_genres = Set.new

10.times do
  genre = Faker::Music.genre

  while existing_genres.include?(genre)
    genre = Faker::Music.genre
  end

  existing_genres << genre

  Category.create(genre: genre)
end


#vinilos
values = ["new", "used"]
60.times do  
  vinyl = Vinyl.create(
    title: Faker::Music.album,
    description: Faker::Lorem.sentence(word_count: 5),
    author: Faker::Music.band,
    user_id: users.sample,
    condition: values.sample
  )
  random = rand(1..19)
  vinyl.image.attach(io: File.open("app/assets/images/00"+"#{random}"+".jpg"), filename: "00"+"#{random}"+".jpg", content_type: 'image/jpg')
end