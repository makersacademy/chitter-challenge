require 'faker'

Faker::Config.random = Random.new(10)

if ENV['RACK_ENV'] == 'test'
  10.times do
    fake_name = Faker::Name.name
    fake_data = Faker::Internet.unique.user('username', 'email', 'password')
    User.create(
      name: fake_name,
      username: fake_data[:username],
      email: fake_data[:email],
      password: fake_data[:password]
    )
  end

  30.times do
    Cheep.create(
      content: Faker::Company.bs,
      user_id: Faker::Number.between(from: 1, to: 10)
    )
  end
    
else
  User.create(
    name: "Thomas McCoy",
    username: "the_chitter_guy",
    email: "hello@example.com",
    password: "password123"
  )
  Cheep.create(content: "Development content", user_id: 1)
end
