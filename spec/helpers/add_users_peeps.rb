require_relative '../../lib/user'
require_relative '../../lib/peep'

def create_users_peeps 
  
  user = User.create(
    name: 'Jack',
    username: 'JD',
    email: 'jd@chitter.com',
    password: 'shhhh'
  )
  
  user.peeps.create(message: 'This is my first peep')
  user.peeps.create(message: 'Another peep from me')
  
  user2 = User.create(
    name: 'Mark',
    username: 'MZ',
    email: 'mz@smugbook.com',
    password: 'secret'
  )
  
  #probably a code smell
  sleep(1)
  
  user2.peeps.create(message: 'This is a smug peep')
  user2.peeps.create(message: 'Another peep from me')

end
