require 'pg'

def setup_test_database
    p "Setting up database, please hold..."

    connection = PG.connect(dbname: 'chitter_db_test')

    # Clean table
    connection.exec("TRUNCATE peeps;")
    
    
end