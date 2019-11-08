require 'pg'

def setup_test_database
    p "Clearing test database..."

    connection = PG.connect(dbname: 'chitter_test')
    
    connection.exec("TRUNCATE users, message;")    
end
