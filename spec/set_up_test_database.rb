require 'PG'

def set_up_test_database
  p 'setting up test database'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE table users;')
end
