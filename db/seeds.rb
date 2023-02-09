require_relative "../models/user"
require_relative "../models/peep"
require_relative "../models/like"

# Create users
terry = User.create!(name: "Terry Cheng", email: "terryhycheng@gmail.com", password: "2345", password_confirmation: "2345", username: "terryhycheng")
mary = User.create!(name: "Mary Tsang", email: "marytsangg@gmail.com", password: "1234", password_confirmation: "1234", username: "marytsang")

# Create peeps
terry_peep = Peep.create!(content: "It’s a lovely day today!", user: terry)
mary_peep = Peep.create!(content: "I got a bad news this morning ;(", user: mary)

# Create likes
Like.create!(user: terry, peep: mary_peep)
Like.create!(user: terry, peep: terry_peep)
Like.create!(user: mary, peep: mary_peep)
Like.create!(user: mary, peep: terry_peep)
