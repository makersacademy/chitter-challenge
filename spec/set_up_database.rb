require 'pg'

def setup_test_database
    
     connection = PG.connect(dbname: 'chitter_manager_test')
 
     # Clear the bookmarks table
    connection.exec("TRUNCATE peeps, users;")
end