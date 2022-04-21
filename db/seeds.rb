# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

code = "password"

50.times do 
    User.create(
       email: "user#{rand(100..200)}@example.com",
       collectionist_name: Faker::Name.name,
       password: code)
end


AdminUser.create!(email: 'admin@example.com', password: code, password_confirmation: 'password') if Rails.env.development?