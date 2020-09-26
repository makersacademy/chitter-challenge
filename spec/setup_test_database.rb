require 'pg'

def setup_test_database
  con = PG.connect :dbname => "chitter_test"
  con.exec("TRUNCATE chitters;")
  Peep.all
end
 
def persisted_data(id:)
  connection = PG.connect(dbname: "chitter_test")
  result = connection.query("SELECT * FROM chitters WHERE id = #{id};")
  result.first
end
