# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |n|
  name  = Faker::Name.name
  Product.create!(name: name, description: "string", image: "string",
    quantity: 2, category_id: 1, price: 100, status: true)
end

User.create!(name:  "manh",
             email: "manh@gmail.com",
             phone: "1111111111"
             address: "1111111111"
             password:              "111111",
             password_confirmation: "111111",
             admin: true)
