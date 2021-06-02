def clear_test_database

  puts "Clearing test database"
  connection = PG.connect(dbname: "chitter_test")
  connection.exec("TRUNCATE messages, users;")
  
end
