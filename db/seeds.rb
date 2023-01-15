require 'faker'

puts "🌱 Seeding spices..."

# DatabaseCleaner.clean_with(:truncation)

User.create(
  username: "abodian",
  password: "test",
  first_name: "Alex",
  last_name: "Smith",
  email: "abodian@email.com",
)

20.times do
  User.create(
    username: Faker::Internet.unique.username,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
  )
end

20.times do
  Peep.create(
    content: Faker::Lorem.sentence(word_count: rand(2..10)).chomp('.'),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default),
    user_id: Faker::Number.between(from: 1, to: 20)
  )
end

10.times do
  Reply.create(
    content: Faker::Lorem.sentence(word_count: rand(2..10)).chomp('.'),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default),
    user_id: Faker::Number.between(from: 1, to: 20),
    peep_id: Faker::Number.between(from: 1, to: 20)
  )
end

puts "✅ Done seeding!"
