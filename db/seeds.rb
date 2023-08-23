# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning database..."
Restaurant.destroy_all
Review.destroy_all

puts 'Creating 5 fake restaurants...'
5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::Number.leading_zero_number(digits: 10),
    category: %w[chinese italian japanese french belgian].sample
  )
  restaurant.save!
end
puts 'Finished!'

puts 'Creating 25 fake reviews...'
25.times do
  review = Review.new(
    rating: Faker::Number.between(from: 0, to: 5),
    content: Faker::Restaurant.review,
    # restaurant_id: Faker::Number.between(from: 0, to: 5)
  )
  review.save!
end
puts 'Finished!'
