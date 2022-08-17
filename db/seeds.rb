# setting the categories
require 'faker'

categories = ["chinese", "italian", "japanese", "french", "belgian"]
rating = rand(0..5).to_i
puts "Creating restaurants"

5.times do
  restaurant = Restaurant.new
  restaurant.name = Faker::Restaurant.unique.name
  restaurant.address = Faker::Address.street_address
  restaurant.phone_number = Faker::Number.leading_zero_number(digits: 10)
  restaurant.category = categories.sample

  restaurant.save!

  review = Review.new(rating: rating, content: Faker::Restaurant.review)
  review.restaurant = restaurant

  review.save!

  puts "Restaurant created"
end

puts "all restaurants were created"
