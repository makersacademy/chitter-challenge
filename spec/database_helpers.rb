require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_board_test')
  connection.query("SELECT * FROM peeps WHERE id = '#{id}';")
end
