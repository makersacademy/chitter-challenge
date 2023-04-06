require 'faker'
require_relative '../lib/user.rb'
require_relative '../lib/post.rb'
require_relative '../lib/reply.rb'

puts 'Seeding...'

20.times do
  User.create(
    username: Faker::Internet.username,
    real_name: Faker::Name.name,
    email: Faker::Internet.email,
    password_digest: "1234"
  )
end

40.times do
  time = Faker::Time.between(from: DateTime.now - 4, to: DateTime.now)  
  Post.create(
    content: Faker::Lorem.sentence(word_count: rand(10..15)),
    created_at: time,
    updated_at: time,
    user_id: Faker::Number.between(from: 1, to: 20)
  )
end

10.times do
Reply.create(
  user_id: Faker::Number.between(from: 1, to: 20),
  post_id: Faker::Number.between(from: 1, to: 20)
)
end

puts 'Seeding completed.'
