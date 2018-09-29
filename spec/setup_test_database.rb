require 'pg'
#require '../lib/database_connection.rb'

def setup_test_database
  conn = PG.connect dbname: 'peeps_test'
  conn.exec ('TRUNCATE peeps, users')
end

def setup_user_database
  conn = PG.connect dbname: 'peeps_test'
  conn.exec ('TRUNCATE peeps')
  # if ENV['ENVIRONMENT'] == 'test'
  #   DatabaseConnection.setup('peeps_test')
  # else
  #   DatabaseConnection.setup('peeps_manager')
  # end
  # #conn = PG.connect dbname: 'peeps_test'
  # DatabaseConnection.query ('TRUNCATE users, peeps')
end

# def persisted_data(table:, id:)
#   DatabaseConnection.setup('peeps_test')
#   DatabaseConnection.query("SELECT * FROM #{table} WHERE user_id = '#{id}';")
# end
