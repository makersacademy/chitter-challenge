require 'pg'

def query_data(table, id)
  PG.connect(dbname: 'chitter_test').query("SELECT * FROM #{table} WHERE id = #{id};").first
end

def setup_test_database
  con = PG.connect(dbname: 'chitter_test')
  con.exec("TRUNCATE messages, users;")
end