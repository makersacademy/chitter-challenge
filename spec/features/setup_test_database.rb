require 'pg'

def setup_test_database

  connection = PG.connect(dbname: 'chitter_manager_test')
  connection.exec('TRUNCATE peeps;')
  connection.exec('TRUNCATE users;')

end
