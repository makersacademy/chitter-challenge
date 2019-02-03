require 'pg'

def setup_test_database
  p 'Setting up the test database...'

  @connection = PG.connect(dbname: 'Chitter_test')

  @connection.exec('DROP TABLE peeps;')

  @connection.exec('CREATE TABLE peeps(id SERIAL PRIMARY KEY,user_name VARCHAR(60), peep  VARCHAR(140));')
  @connection.exec("INSERT INTO peeps (peep) VALUES('Test peep 1');")
  @connection.exec("INSERT INTO peeps (peep) VALUES('Test peep 2');")
  @connection.exec("INSERT INTO peeps (peep) VALUES('Test peep 3');")
end
