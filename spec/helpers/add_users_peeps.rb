require './lib/user'
require './lib/peep'

def create_users_peeps

  user = User.create(
    name: 'Ian',
    username: 'iaquino47',
    email: 'ianaquino47@gmail.com',
    password: 'password123'
  )

  user.peeps.create(message: 'This is my first peep')
  user.peeps.create(message: 'Another peep from me')

  user2 = User.create(
    name: 'Brian',
    username: 'brijake',
    email: 'bri@yahoo.com',
    password: 'wordpass123'
  )


   sleep(1)

  user2.peeps.create(message: 'This is a test peep')
  user2.peeps.create(message: 'Another test peep')

end
