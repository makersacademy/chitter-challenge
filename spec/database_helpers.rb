require 'user'

def setup_test_database
  DatabaseConnection.setup('chitter_app_test')
  DatabaseConnection.query('TRUNCATE TABLE peeps, users')
  user = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES ('user', 'username', 'user@email.com', 'password') RETURNING id, name, username, email, password")
  DatabaseConnection.query("INSERT INTO peeps (text, timestamp, user_id) VALUES ('hello world', '#{Time.now}', '#{user[0]['id']}') RETURNING id, text, timestamp, user_id")
end
