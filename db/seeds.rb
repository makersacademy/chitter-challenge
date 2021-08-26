require './lib/user'

# User.destroy_all

User.create!([{
    first_name: 'sir david', 
    last_name: 'attenborough', 
    username: 'AttyBoi', 
    email: 'david@example.com', 
    password: 'freetheAnim4lz'
  },
  { first_name: 'Tinker', 
    last_name: 'Bell', 
    username: 'TinkyWinky', 
    email: 'tinkerbell@example.com', 
    password: 'c0verMEinfairydust'
  }
])

p "Created #{User.count} new users"
# users.each do |user|
#   User.create!(user)
# end