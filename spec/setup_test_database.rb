require 'pg'

def setup_test_database

p "setting up test database..."

connection = PG.connect(dbname: 'chitter_challenge_test')

#clear the peeps_table
connection.exec("TRUNCATE peeps_table;")

end
