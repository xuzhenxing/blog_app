# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "123",
             email: "123@123.org",
             password: "123456",
             password_confirmation: "123456",
             admin: true)
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password  = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
# users = User.all(limit: 1)
# 50.times do
#   title = Faker::Lorem.sentence(2)
#   body = Faker::Lorem.sentence(10)
#   view_number = rand(100)
#   users.each {
#   	|user| user.blogs.create!(title: title,
#   		body: body,
#   		approved_comments_count: 0,
#   		# user_id: user.id,
#   		view_number: view_number
#   		)
#   }
# end
# namespace :db do
#   desc "Fill database with sample data"
#   task populate: :environment do
#     User.create!(name: "123",
#                  email: "123@123.org",
#                  password: "123456",
#                  password_confirmation: "123456",
#                  admin: true)
#     99.times do |n|
#       name  = Faker::Name.name
#       email = "example-#{n+1}@railstutorial.org"
#       password  = "password"
#       User.create!(name: name,
#                    email: email,
#                    password: password,
#                    password_confirmation: password)
#     end
#     users = User.all(limit: 1)
#     50.times do
#       title = Faker::Lorem.sentence(2)
#       body = Faker::Lorem.sentence(10)
#       users.each { |user| user.blogs.create!(title: title) }
#       users.each { |user| user.blogs.create!(body: body) }
#     end
#   end
# end