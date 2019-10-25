require 'pg'

def clearing_the_test_database
connection = PG.connect(dbname: 'chitter_test')
connection.exec('TRUNCATE feed;')
end
