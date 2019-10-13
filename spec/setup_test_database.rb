require 'pg'

p "Setting up database..."

def setup_test_database

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('DROP TABLE IF EXISTS peeps;')

end
