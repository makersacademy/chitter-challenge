require 'pg'

def setup_test_database
  p "Setting up test database ... peep peep ..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps, users;")
end