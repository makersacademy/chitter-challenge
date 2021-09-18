def fill_data
  PGDatabase.con.exec("TRUNCATE message;")
  PGDatabase.con.exec_params("INSERT INTO message (id_users, message) VALUES ($1,$2);", ['1', 'Lovely Stuff'])
  PGDatabase.con.exec_params("INSERT INTO message (id_users, message) VALUES ($1,$2);", ['1', 'Lovely Stuff 2'])
end

def select_all_from_message( id:) 
  result = PGDatabase.con.exec_params("SELECT * FROM message WHERE id = $1;", [ id])
  result.first
end