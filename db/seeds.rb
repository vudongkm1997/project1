# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create! name: "Apple"
Category.create! name: "Samsung"

15.times do |n|
  name  = "IphoneN-#{n+1}"
  des = "Iphone Iphone Iphone Iphone-#{n+1}@railstutorial.org"
  Product.create!(name:  name, category_id: 1, description: des,
    image: "product1.png", quantity: 10, price: 50, status: 1, camera: "2.0",
    os: "IOS", cpu: "kinkston", ram: "20Gb", screen: "HD",memory: "64")
end

20.times do |n|
  name  = "SamsungN-#{n+1}"
  des = "Samsung Samsung Samsung Samsung-#{n+1}@railstutorial.org"
  Product.create!(name:  name, category_id: 2, description: des,
    image: "product1.png", quantity: 10, price: 50, status: 1, camera: "1.0",
    os: "Android", cpu: "kinkston", ram: "10Gb", screen: "HD",memory: "128")
end

5.times do |n|
  date = "2018-01-#{n+10} 03:53:15"
  Cart.create! user_id: 1, cart_price: 200.0, status: 1, created_at: date, updated_at: date
end

5.times do |n|
  date = "2018-01-#{n+10} 03:53:15"
  CartItem.create! cart_id: 3, product_id: 10, quantity: 1, total_price: 50.0, created_at: date, updated_at: date
end
