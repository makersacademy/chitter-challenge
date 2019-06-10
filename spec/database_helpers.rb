def create_users
  User.create(username: 'Peter', password: '12345')
  User.create(username: 'Bird person', password: '12345678')
  User.create(username: 'Magpie', password: 'password')
end

def create_peeps 
  Peep.create(text: "First ever peep!!!!",
              created_at: Time.now,
              user_id: User.first({ username: 'Peter' })[:id])
  Peep.create(text: "Tweet tweet",
              created_at: Time.now,
              user_id: User.first({ username: 'Magpie' })[:id])
  Peep.create(text: "I have no egrets",
              created_at: Time.now,
              user_id: User.first({ username: 'Peter' })[:id])
end
