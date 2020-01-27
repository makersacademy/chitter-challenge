def setup_test_database
  DatabaseConnection.setup
  DatabaseConnection.query('TRUNCATE users, peeps')
  DatabaseConnection.query("INSERT INTO users (username, email, name, password) VALUES ('tommygun', 'tommy@gun.com', 'Tommy Gun', '00100100')")
  DatabaseConnection.query("INSERT INTO peeps (uid, msg) VALUES ('#{User.all.last.uid}', 'First Peep')")
  DatabaseConnection.query("INSERT INTO peeps (uid, msg) VALUES ('#{User.all.last.uid}', 'sed nisi lacus sed viverra tellus in hac habitasse platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt')")
end