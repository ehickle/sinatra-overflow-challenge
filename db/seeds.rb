require 'faker'

10.times { User.create(username: Faker::HarryPotter.character, email: Faker::Internet.email, password_hash: 'password') }

User.all.each do |user|
  user.questions.create(title: Faker::Pokemon.name, body: Faker::Lorem.paragraph)
end
