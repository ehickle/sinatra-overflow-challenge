require 'faker'

10.times { User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: 'password') }

User.all.each do |user|
  user.questions.create(title: Faker::Pokemon.name, body: Faker::Lorem.paragraph)
end
