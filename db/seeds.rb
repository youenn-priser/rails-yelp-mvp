# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
print 'Cleaning DB...........'
Restaurant.destroy_all
puts 'OK'

print 'Seeding restaurants...'
20.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: %w[chinese italian japanese french belgian].sample,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
  )

  rand(1..3).times do
      Review.create!(
        content: Faker::Restaurant.review,
        rating: rand(1..5),
        restaurant: restaurant
      )
  end
end
puts 'OK'
