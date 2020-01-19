def setup_test_database
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query('TRUNCATE users, peeps')
  # DatabaseConnection.query('TRUNCATE peeps')
  DatabaseConnection.query("INSERT INTO users (username, email, name, password) VALUES ('tommygun', 'tommy@gun.com', 'Tommy Gun', 'tommythebest')")
end
