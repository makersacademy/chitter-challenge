require 'pg'

def populate_test_data
  Peep.add('Test peep')
  Peep.add('Peeping about snow')
  Peep.add('Peep 2')
end

def persisted_data(id)
  connection = PG.connect(dbname: 'chitter_testing')
  connection.query("SELECT * FROM users WHERE id = #{'id'};")
end
