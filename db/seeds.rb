require 'faker'
require 'bcrypt'
require_relative '../lib/user.rb'
require_relative '../lib/post.rb'
require_relative '../lib/reply.rb'

puts 'Seeding...'

5.times do
  User.create(
    username: Faker::Internet.username,
    real_name: Faker::Name.name,
    email: Faker::Internet.email,
    password_digest: BCrypt::Password.create('password')
  )
end

### This user is manually created to make sure we get consistent data across different seeds in tests.
User.create(
  username: "Useface",
  real_name: "Userton Usersmith",
  email: "Userella@userio.uo",
  password_digest: BCrypt::Password.create('usersville')
)

30.times do
  time = Faker::Time.between(from: DateTime.now - 4, to: DateTime.now)  
  Post.create(
    content: Faker::Lorem.sentence(word_count: rand(10..15)),
    created_at: time,
    updated_at: time,
    user_id: Faker::Number.between(from: 1, to: 6)
  )
end

### This is the post the manually created user has definitely posted.
Post.create(
  content: "I pray for the day where we stop using sinatra",
  created_at: Time.new(2023, 03, 20, 10, 39, 15),
  updated_at: Time.new(2023, 03, 20, 10, 39, 15),
  user_id: 6
)

10.times do
Reply.create(
  user_id: Faker::Number.between(from: 1, to: 5),
  post_id: Faker::Number.between(from: 1, to: 10)
)
end

puts 'Seeding completed.'
