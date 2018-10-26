require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'peep_manager_test')
  connection.query("SELECT * FROM peeps WHERE id = '#{id}';")
end
