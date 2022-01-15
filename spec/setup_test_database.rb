require 'pg'

def setup_test_database
  puts 'Setting up database...'
  PG.connect(dbname: 'chitter_test').exec("TRUNCATE TABLE peeps;")
end