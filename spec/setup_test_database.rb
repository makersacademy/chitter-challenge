require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_manager_test')
  connection.exec("TRUNCATE peeps;")
  connection2 = PG.connect(dbname: 'chitter_accounts_test')
  connection2.exec("TRUNCATE accounts;")
end
