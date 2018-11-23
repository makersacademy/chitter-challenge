require 'pg'

def persisted_data(peepid:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM peeps WHERE peepid = #{peepid};")
  result.first
end
