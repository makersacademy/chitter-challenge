# require './lib/db_connection'
#
# if ENV['ENVIRONMENT'] == 'test'
#   connection = DbConnection.setup('chitter_test')
# else
#   connection = DbConnection.setup('chitter')
# end

require 'pg'

def setup_test_db
  connection = PG.connect(dbname: 'chitter_test')

  # Clean the bookmarks table
  connection.exec("TRUNCATE peeps;")
end
