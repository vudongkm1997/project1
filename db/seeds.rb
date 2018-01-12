# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create! id: 1, name: "iPhone"
Category.create! id: 2, name: "Samsung"

15.times do |n|
  name  = "IphoneN-#{n+1}"
  des = "Iphone Iphone Iphone Iphone-#{n+1}@railstutorial.org"
  Product.create! name:  name, category_id: 1,
    description: des, image: "product1.png", quantity: 10, price: 50, status: 1
end
20.times do |n|
  name  = "SamsungN-#{n+1}"
  des = "Samsung Samsung Samsung Samsung-#{n+1}@railstutorial.org"
  Product.create! name:  name, category_id: 2,
    description: des, image: "product1.png", quantity: 10, price: 50, status: 1
end
