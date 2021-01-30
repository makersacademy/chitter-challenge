require 'pg'

def peep_persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM peeps WHERE id = #{id};")
end
