require 'pg'




def row_creation_verifier(table:,id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("SELECT * FROM #{table} WHERE id = #{id}").first
end

def reset_table
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE user_accounts")
  connection.exec("TRUNCATE chits")
end
