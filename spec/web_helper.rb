def empty_database
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE users;")
end