require 'pg'
require './lib/database_connection'

def setup_test_database
  p 'Setting up test database...'

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE chirps, comments;")
end

