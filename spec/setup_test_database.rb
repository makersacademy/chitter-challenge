# Allowing file to use PG commands
require 'pg'

# Method called every time RSPEC is run to truncate (empty)
# peeps table in chitter_challenge_test database
def setup_test_database
  connection = PG.connect(dbname: 'chitter_challenge_test')
  connection.exec("TRUNCATE peeps;")
end
