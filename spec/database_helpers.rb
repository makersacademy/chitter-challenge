require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'chitter_peeps_test')
  result = connection.query("SELECT * FROM news_feed WHERE id = #{id};")
  result.first
end