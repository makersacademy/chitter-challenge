User.create!(
  name:  "Bob Ross",
  email: "bobross@mail.com",
  password:              "password123",
  password_confirmation: "password123"
)

99.times do |n|
  name  = "bob-#{n+1}"
  email = "bobross-#{n+1}@mail.com"
  password = "password"
  User.create!(
    name:  name,
    email: email,
    password:              'password123',
    password_confirmation: 'password123'
  )
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.peeps.create!(content: content) }
end
