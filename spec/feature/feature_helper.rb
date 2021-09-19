def fill_data
  PGDatabase.con.exec("TRUNCATE message, users;")
  # ["users","message"].each { |table| reset_id_seq(table) }
  user = PGDatabase.con.exec_params("INSERT INTO users (user_name, email, password) VALUES ($1,$2,$3) RETURNING *;", ['admin', 'admin@admin.com' , 'password']).first
  PGDatabase.con.exec_params("INSERT INTO message (id_users, message) VALUES ($1,$2);", [ user["id"], 'Lovely Stuff'])
  PGDatabase.con.exec_params("INSERT INTO message (id_users, message) VALUES ($1,$2);", [ user["id"], 'Lovely Stuff 2'])
  PGDatabase.con.exec_params("INSERT INTO message (id_users, message) VALUES ($1,$2);", [ user["id"], 'Lovely Stuff 3'])
end

def sign_up
  visit('/')
  click_button('Sign Up')
  fill_in('username', with: 'username')
  fill_in('email', with: 'username@gmail.com')
  fill_in('password', with: 'password')
  click_button('Sign up')
end

# first line didn't work
# https://stackoverflow.com/questions/4678110/how-to-reset-sequence-in-postgres-and-fill-id-column-with-new-data
# def reset_id_seq(table)
  # PGDatabase.con.exec("UPDATE $1 SET id=1000000+ nextval('seq');", [table])
  # PGDatabase.con.exec("UPDATE #{table} SET id=1000000+ nextval('#{table}_id_seq');")
# end

def select_all_from_message( id:) 
  result = PGDatabase.con.exec_params("SELECT * FROM message WHERE id = $1;", [ id])
  result.first
end