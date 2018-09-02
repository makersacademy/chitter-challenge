require_relative '../lib/database_connection'

def delete_and_fill_database(db = 'chitter_manager_test')
    DatabaseConnection.setup
    DatabaseConnection.query("TRUNCATE TABLE users CASCADE;")
    DatabaseConnection.query("TRUNCATE TABLE peeps;")
    DatabaseConnection.query("INSERT INTO users (username, name, email, password) VALUES ('andrew', 'Andrew Wood', 'test@gmail.com', 'pwd12');")
    DatabaseConnection.query("INSERT INTO peeps (comment, time) VALUES ('Just watched GBBO', '#{Time.new}'), ('Back to coding now', '#{Time.new}')")
end

def log_out_active
  User.log_out
end
