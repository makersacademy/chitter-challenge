require_relative '../models/peep'

def add_peeps
  Peep.create(message: 'This is my first peep!', creator: 'USER_1')
  Peep.create(message: 'This is my second peep!', creator: 'USER_2')
  Peep.create(message: 'This is my third peep!', creator: 'USER_3')
end