require 'pg'

def persisted_data(peep_id:)
  connection = PG.connect(dbname: 'chitter_challenge_test')
  result = connection.query("SELECT * FROM peeps WHERE peep_id = #{peep_id};")
  result.first
end

def persisted_data_account(account_id:)
  connection = PG.connect(dbname: 'chitter_challenge_test')
  result = connection.query("SELECT * FROM accounts WHERE account_id = #{account_id};")
  result.first
end
