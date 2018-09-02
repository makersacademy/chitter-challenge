require_relative '../lib/database_connection'

def delete_and_fill_database(db = 'chitter_manager_test')
    DatabaseConnection.setup
    DatabaseConnection.query("TRUNCATE TABLE peeps;")
end
