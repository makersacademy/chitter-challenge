require_relative '../lib/database_connection'

def delete_and_fill_database(db = 'chitter_manager_test')
    DatabaseConnection.setup
    DatabaseConnection.query("TRUNCATE TABLE users CASCADE;")
    DatabaseConnection.query("TRUNCATE TABLE peeps;")
    user_id = DatabaseConnection.query("INSERT INTO users (id, username, name, email, password) VALUES (1, 'andrew', 'Andrew Wood', 'test@gmail.com', 'pwd12') RETURNING id;")[0]['id']
    DatabaseConnection.query("INSERT INTO peeps (user_id, comment, time) VALUES ('#{user_id}', 'Just watched GBBO', '#{Time.new}'), ('#{user_id}', 'Back to coding now', '#{Time.new}')")
end

def log_out_active
  User.log_out
end

def log_in
  visit '/'
  find('#login').click
  fill_in :username, with: 'andrew'
  fill_in :password, with: 'pwd12'
  click_button "Submit"
end
