require_relative "../lib/peep"
require_relative "../lib/user"
require_relative "../lib/tag"

# Remove current records and reset primary keys
Peep.destroy_all
Tag.destroy_all
User.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('peeps')
ActiveRecord::Base.connection.reset_pk_sequence!('tags')
ActiveRecord::Base.connection.reset_pk_sequence!('users')


# Users seeding

user1 = User.create(name: "User 1", email_address: "User1@gmail.com", password: "password1")
user2 = User.create(name: "User 2", email_address: "User2@gmail.com", password: "password2")
user3 = User.create(name: "User 3", email_address: "User3@gmail.com", password: "password3")
user4 = User.create(name: "User 4", email_address: "User4@gmail.com", password: "password4")
user5 = User.create(name: "User 5", email_address: "User5@gmail.com", password: "password5")

# Tags seeding

tag1 =Tag.create(content: "cooking")
tag2 =Tag.create(content: "greetings")
tag3 =Tag.create(content: "politics")

# Peeps seeding (overriding created_at with specific time values to make them deterministic for testing)

# overrides ActiveRecord's default timezone of UTC,
# which converts the fake times to be an hour earlier in the database.
ActiveRecord.default_timezone = :local

peep1 = Peep.new(text: "Hello world", created_at: Time.parse("2023-05-10 09:00:00"))
peep1.user=(user1)
peep1.tags<<(tag2)
peep1.save

peep2 = Peep.new(text: "What's up with politics?", created_at: Time.parse("2023-05-10 12:30:00"))
peep2.user=(user1)
peep2.tags<<(tag3)
peep2.save

peep3 = Peep.new(text: "I love cooking.", created_at: Time.parse("2023-05-10 12:10:00"))
peep3.user=(user2)
peep3.tags<<(tag1)
peep3.save

peep4 = Peep.new(text: "I love pizza.", created_at: Time.parse("2023-05-10 13:00:00"))
peep4.user=(user3)
peep4.tags<<(tag1)
peep4.save

peep5 = Peep.new(text: "Hey there", created_at: Time.parse("2023-05-10 12:20:00"))
peep5.user=(user4)
peep5.tags<<(tag2)
peep5.save

peep6 = Peep.new(text: "What's up", created_at: Time.parse("2023-05-10 12:00:00"))
peep6.user=(user5)
peep6.tags<<(tag2)
peep6.save


