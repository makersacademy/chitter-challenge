# Setups up a clean database for testing
require 'pg'

def setup_test_database

  conn = PG.connect(dbname: 'chitter_db_test')

  # Empties the database and resets ID
  conn.exec ("TRUNCATE peeps RESTART IDENTITY")
  conn.exec ("INSERT INTO peeps (message) VALUES('Test Peep!')")

end
