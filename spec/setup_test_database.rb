require 'pg'
p 'Setting up database'
def setup_db!
    connection = PG.connect(dbname: 'peep_test')
    connection.exec("TRUNCATE peeps;")
end