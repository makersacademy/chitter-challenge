require_relative '../../lib/user'
require_relative '../../lib/peep'

def create_users_peeps

  user = User.create(
    name: 'Elfi',
    username: '@Elfi',
    email: 'ef@chitter.com',
    password: '123456'
  )

  user.peeps.create(message: 'This is my first peep')
  user.peeps.create(message: 'Another peep from me')

  user2 = User.create(
    name: 'Neil',
    username: '@Neil',
    email: 'neil@peep.com',
    password: '12345'
  )

  #probably a code smell
  sleep(1)

  user2.peeps.create(message: 'This is a smug peep')
  user2.peeps.create(message: 'Another peep from me')

end
