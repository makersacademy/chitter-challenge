require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("SELECT * FROM peeps WHERE id = '#{id}';").first
end
