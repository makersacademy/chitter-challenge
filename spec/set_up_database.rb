require 'pg'

p "setting up the database..."

connection = PG.connect(dbname:'peep_manager_test')

connection.exec("TRUNCATE peeps;")
