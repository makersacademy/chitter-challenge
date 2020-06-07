def clear_table
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query('TRUNCATE TABLE feed, users, peeps')
  DatabaseConnection.query("INSERT INTO users (username, email, password, full_name) 
                           VALUES('test1', 'test1@email.com', 'test1password', 'test one');")
end
