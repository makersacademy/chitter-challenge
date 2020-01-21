require 'pg'

def setup_test_database

connection = PG.connect(dbname: 'chitter_test')

connection.exec("TRUNCATE peep, users;")

end
