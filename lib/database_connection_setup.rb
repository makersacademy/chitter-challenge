require './lib/database_connection'
require 'pg'

def setup_test_database
  if ENV['ENVRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_chatter_test')
    p "Setting up test database..."
    connection.exec("TRUNCATE peeps;")
  else
    connection = PG.connect(dbname: 'chitter_chatter')
  end
end