require 'pg'

def empty_test_db
    connection = PG.connect :dbname => 'chitter_test'
    connection.exec "TRUNCATE TABLE details"
    connection.exec "TRUNCATE TABLE posts"
end