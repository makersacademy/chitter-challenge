require 'pg'

def setup_test_database
  p "Setting up test database...:D"
  connection = PG.connect(dbname: 'chitter_board_test')

  #Clean the peeps table
  connection.exec("TRUNCATE peeps;")
end
