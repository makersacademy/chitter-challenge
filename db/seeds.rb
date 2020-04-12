user1 = User.create(
  first_name: 'Dave',
  last_name: 'Dude',
  email: 'davedude@example.com',
  user_name: 'davedude',
  password: 'password123'
)

user2 = User.create(
  first_name: 'Jim',
  last_name: 'Guy',
  email: 'jimguy@example.com',
  user_name: 'jimguy',
  password: 'password123'
)

Peep.create(content: "I love to peep!", user_id: user1.id)
Peep.create(content: "My name is Dave and I am a cool dude!", user_id: user1.id)
Peep.create(content: "Peeping is great!", user_id: user2.id)
Peep.create(content: "I am Jim and I am an alright guy.", user_id: user2.id)
