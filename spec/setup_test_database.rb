require 'pg'

def test_setup
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE TABLE peeps")
end
