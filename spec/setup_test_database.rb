require 'pg'

def setup_test_database
  p "Setting up test database ... "
  connection = PG.connect(dbname: 'chitter_db_test')
  connection.exec("TRUNCATE peeps_list;")
end
