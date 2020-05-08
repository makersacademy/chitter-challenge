# require 'pg'
#
# def setup_test_database
#   p "Connecting to test database..."
#
#   connection = PG.connect(dbname: 'chitter_manager_test')
#
#   # Clear the peeps table
#   connection.exec("TRUNCATE peeps;")
# end
