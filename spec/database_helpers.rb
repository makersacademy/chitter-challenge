require 'pg'

def persisted_data(body:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM peeps WHERE body = #{body};")
  result.first
end