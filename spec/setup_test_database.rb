require 'pg'

def setup_test_database

connect_to_database = PG.connect(dbname: 'chitter_test')
connect_to_database.exec("TRUNCATE peeps;")
connect_to_database.exec("TRUNCATE users;")

end
