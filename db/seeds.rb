require './lib/users'

users = [
  {first_name: 'sir david', last_name: 'attenborough', email: 'david@example.com'},
  {first_name: 'susan', last_name: 'for a boy', email: 'charlie@example.com'}
]

users.each do |user|
  User.create(user)
end