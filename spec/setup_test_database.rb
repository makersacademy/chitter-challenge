# ./spec/setup_test_database.rb

require 'pg'

def setup_test_database # called in spec_helper, run before every test
  # connect to the testing database, not dev database
  connection = PG.connect(dbname: 'chitter_test')
  # truncate the testing database - peeps
  connection.exec('TRUNCATE peeps;')
end
