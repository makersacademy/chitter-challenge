require 'pg'

def setup_test_database
  DBConnection.query('TRUNCATE users CASCADE')
end
