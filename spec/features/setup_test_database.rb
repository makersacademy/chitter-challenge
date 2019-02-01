# Setups up a clean database for testing
require 'pg'

def setup_test_database

  conn = PG.connect(dbname: 'chitter_db_test')

  # Empties the database and resets ID
  conn.exec ("TRUNCATE peeps, users RESTART IDENTITY")

  # Adds 1 row to peeps and users for testing
  conn.exec ("INSERT INTO peeps (message, created) VALUES('Test Peep!', 'Right Now!')")
  conn.exec ("INSERT INTO users (username, email, password) VALUES('defaultuser', 'testemail@gmail.com', 'password')")

end
