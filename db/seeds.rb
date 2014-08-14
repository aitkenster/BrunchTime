# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
Review.destroy_all

chipotle = Restaurant.create(name:"Chipotle", cuisine: "Mexican")
chipotle.reviews.create(reviewer: "Nicola", review: "Awesome", rating: 5)
chipotle.reviews.create(reviewer: "Lucy", review: "Mouldy", rating: 1)
chipotle.reviews.create(reviewer: "Helen", review: "Pretty good", rating: 4)
chipotle.reviews.create(reviewer: "Hanah", review: "Average", rating: 3)
chipotle.reviews.create(reviewer: "Alice", review: "Not great", rating: 2)

