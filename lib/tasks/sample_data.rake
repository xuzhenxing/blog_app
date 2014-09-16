namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
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
    users = User.all(limit: 1)
    50.times do
      title = Faker::Lorem.sentence(2)
      body = Faker::Lorem.sentence(10)
      users.each { |user| user.blogs.create!(title: title) }
      users.each { |user| user.blogs.create!(body: body) }
    end
  end
end