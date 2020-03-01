require 'pg'

p 'setting up test database...'
def setup_test_database 

connection = PG.connect(dbname: 'chitter_test_database')

connection.exec("TRUNCATE bookmarks;")
end