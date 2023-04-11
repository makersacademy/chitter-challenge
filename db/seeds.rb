require 'faker'
require 'bcrypt'
require_relative '../lib/user'
require_relative '../lib/post'

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
  created_at: Time.new(2023, 0o3, 20, 10, 39, 15),
  updated_at: Time.new(2023, 0o3, 20, 10, 39, 15),
  user_id: 6
)

### This is the second post that was created later than the first one. This should appear first
Post.create(
  content: "I was late so I am shown first",
  created_at: Time.new(2023, 0o3, 21, 10, 39, 15),
  updated_at: Time.new(2023, 0o3, 21, 10, 39, 15),
  user_id: 6
)

5.times do
  time = Faker::Time.between(from: DateTime.now - 4, to: DateTime.now)  
  Post.create(
    content: Faker::Lorem.sentence(word_count: rand(10..15)),
    created_at: time,
    updated_at: time,
    user_id: Faker::Number.between(from: 1, to: 6),
    parent_id: Faker::Number.between(from: 1, to: 30)
  )
end

### This is the reply post the manually created user has definitely posted.
Post.create(
  content: "Best internet arguments start with just one reply",
  created_at: Time.new(2023, 0o3, 21, 20, 12, 55),
  updated_at: Time.new(2023, 0o3, 21, 20, 12, 55),
  user_id: 6,
  parent_id: 31
)

### This is an additional reply post to the same post as before, to test multiple replies.
Post.create(
  content: "And then it carries on like an avalanche from there",
  created_at: Time.new(2023, 0o3, 21, 21, 15, 55),
  updated_at: Time.new(2023, 0o3, 21, 21, 15, 55),
  user_id: 6,
  parent_id: 31
)

puts 'Seeding completed.'
