# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# Create Applications
50.times do
  RegisteredApplication.create!(
    name:  Faker::Name.name,
    url:   Faker::Internet.email
  )
end
registered_applications = RegisteredApplication.all

puts "Seed finished"
puts "#{RegisteredApplication.count} registered applications created"
