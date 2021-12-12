require 'pg'

def persisted_data(created_at:) # get the whole table
  connection = PG.connect(dbname: 'chitter_app_test')
  result = connection.query("SELECT * FROM peeps WHERE created_at = #{created_at};")
  result.first
end