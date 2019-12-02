require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec('DROP TABLE IF EXISTS peeps;')
  connection.exec('CREATE TABLE peeps(id SERIAL PRIMARY KEY, user_handle VARCHAR(60), post VARCHAR(140));')
end
