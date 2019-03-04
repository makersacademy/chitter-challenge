require 'pg'

def setup_test_database

connection = PG.connect(dbname: 'chitterweb_test')
connection.exec("TRUNCATE peeps;")
end
