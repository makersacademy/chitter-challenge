require 'bcrypt'

puts "Seeding..."

# this will work only for sqlite, need to write truncate for postgresql on Heroku if deployed
# https://zditect.com/blog/50981023.html
Peep.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'peeps'") 
User.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'users'") 

User.create(
  name: 'Jack Dorsay',
  username: 'jack',
  email: 'jack@gmail.com',
  password: BCrypt::Password.create('twitter1')
)

User.create(
  name: 'Barack Obama',
  username: 'barackobama',
  email: 'barack@gmail.com',
  password: BCrypt::Password.create('america1')
)

User.create(
  name: 'Elon Musk',
  username: 'elonmusk',
  email: 'elon@gmail.com',
  password: BCrypt::Password.create('tesla1')
)

Peep.create(
  content: 'just setting up my twttr',
  user_id: 1
)

Peep.create(
  content: 'No one is born hating another person because of the color of his skin or his background or his religion...',
  user_id: 2
)

Peep.create(
  content: 'Next I\'m buying Coca-Cola to put the cocaine back in',
  user_id: 3
)

Peep.create(
  content: 'It\'s been the honor of my life to serve you. You made me a better leader and a better man.',
  user_id: 2
)

puts "Seeding done."
