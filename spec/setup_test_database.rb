require 'pg'

def setup_test_database
  DBConnection.query('TRUNCATE peeps')
end
