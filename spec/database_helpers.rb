require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'cheeps_test_database')
  result = connection.query("SELECT * FROM cheeps WHERE id = #{id};")
  result.first
end