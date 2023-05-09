require_relative "../lib/peep"
require_relative "../lib/user"
require_relative "../lib/tag"

# Users seeding

User1 = User.create(name: "User 1", email_address: "User1@gmail.com", password: "password1")
User2 = User.create(name: "User 2", email_address: "User2@gmail.com", password: "password2")
User3 = User.create(name: "User 3", email_address: "User3@gmail.com", password: "password3")
User4 = User.create(name: "User 4", email_address: "User4@gmail.com", password: "password4")
User5 = User.create(name: "User 5", email_address: "User5@gmail.com", password: "password5")

# Tags seeding

tag1 =Tag.create(content: "cooking")
tag2 =Tag.create(content: "greetings")
tag3 =Tag.create(content: "politics")

# Peeps seeding

peep1 = Peep.new(text: "Hello world")
peep1.user=(User1)
peep1.tags<<(tag2)
peep1.save

peep2 = Peep.new(text: "What's up with politics?",)
peep2.user=(User1)
peep2.tags<<(tag3)
peep2.save

peep3 = Peep.new(text: "I love cooking.")
peep3.user=(User2)
peep3.tags<<(tag1)
peep3.save

peep4 = Peep.new(text: "I love pizza.")
peep4.user=(User3)
peep4.tags<<(tag1)
peep4.save

peep5 = Peep.new(text: "Hey there")
peep5.user=(User4)
peep5.tags<<(tag2)
peep5.save

peep6 = Peep.new(text: "What's up")
peep6.user=(User5)
peep6.tags<<(tag2)
peep6.save


