require 'pg'

def persisted_data(id:)
  connect_to_database = PG.connect(dbname: 'chitter_test')
  connect_to_database.query("SELECT * FROM peeps WHERE id = '#{id}';")
end
