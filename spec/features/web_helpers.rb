require 'pg'

def populate_test_data
  Peep.add('Test peep')
  Peep.add('Peeping about snow')
  Peep.add('Peep 2')
end
