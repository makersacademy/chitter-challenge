def fill_data
  PGDatabase.con.exec("TRUNCATE message;")
  PGDatabase.con.exec_params("INSERT INTO message (id_users, message) VALUES ($1,$2);", ['1', 'Lovely Stuff'])
end

def select_all_from(table:, id:) 
  p "I ran"
  result = PGDatabase.con.exec_params("SELECT * FROM $1 WHERE id = $2;", [table, id])
  result.first
end