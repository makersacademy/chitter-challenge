require 'pg'

def persisted_data(peep_id:)
  connection = PG.connect(dbname: 'peeps_manager_test')
  result = connection.query("SELECT * FROM peeps WHERE peep_id = #{peep_id};")
  result.first
end