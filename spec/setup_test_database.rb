require './lib/database_connection'

p "Setting up test database..."

def setup_test_database
    connection = DatabaseConnection.setup('chitter_test')
    #Clear tables 
    connection.query("TRUNCATE users, messages;")

end