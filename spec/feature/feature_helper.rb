def fill_data
  
  PGDatabase.con.exec("TRUNCATE message;")
  p "I ran"
  p ENV["RACK_ENV"]
  # PGDatabase.con.exec_params("INSERT INTO message (id_users, message) VALUES ($1,$2);", ['1', 'Lovely Stuff'])
end