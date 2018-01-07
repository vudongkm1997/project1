# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Tran Duc Manh", email: "ducmanh@gmail.com",
  phone: "0982856230", address: "Hung Yen", password: "111111",
  password_confirmation: "111111", admin: true)
