require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'test_chitter')
  connection.query("SELECT * FROM peeps WHERE id = '#{id}';")
end
