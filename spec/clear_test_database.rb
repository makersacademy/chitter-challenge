def clear_table
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query('TRUNCATE TABLE feed, users, peeps')
  
  encrypted_password = '$2a$12$gHok/Y8mSChCuNqoUUdaFefol6/W2rxRP.1Ay7oBAZ7Zbbvgr6lfS'
  DatabaseConnection.query("INSERT INTO users (username, email, password, full_name) 
                           VALUES('test1', 'test1@email.com', '#{encrypted_password}', 'test one');")
end
