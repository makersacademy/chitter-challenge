require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'peep_manager_test')
  connection.query("SELECT * FROM peeps WHERE id = '#{id}';")
end

def persisted_data_2(id:)
  connection = PG.connect(dbname: 'peep_manager_test')
  connection.query("SELECT * FROM users WHERE id = '#{id}';")
end
