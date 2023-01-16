require 'faker'

3.times do
  User.create(
    username: Faker::Internet.username,
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

5.times do |i|
  users = User.all
  Peep.create(
    content: Faker::Lorem.sentence(word_count: 10, supplemental: false, random_words_to_add: 20),
    user_id: users.shuffle.last.id
  )
end
