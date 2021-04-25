require 'pg'

def database_helper(peep_id:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM peeps WHERE peep_id = '#{peep_id}';")
end
