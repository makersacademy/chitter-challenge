require 'pg'

p "setting up test database"

def setup_test_database
connection = PG.connect(dbname: 'chitter_challenge_test')
p "setting up test database"
connection.exec("Truncate chitters;")
end
