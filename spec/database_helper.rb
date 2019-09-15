require 'pg'

def get_peep_by_id(id:)
  connection = PG.connect(dbname: 'chitter_challenge_test')
  result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
  result.first
end
