require_relative '../lib/database_connection'

def delete_and_fill_database(db = 'chitter_manager_test')
    DatabaseConnection.setup
    DatabaseConnection.query("TRUNCATE TABLE peeps;")
    DatabaseConnection.query("INSERT INTO peeps (comment) VALUES ('Just watched GBBO'), ('Back to coding now')")
end
