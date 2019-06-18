require 'pg'

def persisted_data_peeps(id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM peeps WHERE id = '#{id}';")
end

def persisted_data_users(id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM users WHERE id = '#{id}';")
end
