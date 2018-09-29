require_relative '../lib/database_connection'
require 'bcrypt'

def delete_and_fill_database(_db = 'chitter_manager_test')
  DatabaseConnection.setup
  DatabaseConnection.query("TRUNCATE TABLE users CASCADE;")
  DatabaseConnection.query("TRUNCATE TABLE peeps;")
  user_id = DatabaseConnection.query("INSERT INTO users (id, username, name, email, password) VALUES (1, 'andrew', 'Andrew Wood', 'test@gmail.com', '#{BCrypt::Password.create('pwd12')}') RETURNING id;")[0]['id']
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

def register_new
  visit '/'
  find('#register_user').click
  fill_in :username, with: 'andrew2'
  fill_in :name, with: 'A Wood'
  fill_in :email, with: 'test@hotmail.co.uk'
  fill_in :password, with: 'pwd12'
  fill_in :pass2, with: 'pwd12'
  click_button "Submit"
end
