require './lib/db_connection'

def stored_peep(table:, peep_id:)
  DbConnection.query("SELECT * FROM #{table} WHERE peep_id = '#{peep_id}';")
end

def stored_user(table:, user_id:)
  DbConnection.query("SELECT * FROM #{table} WHERE user_id = '#{user_id}';")
end
