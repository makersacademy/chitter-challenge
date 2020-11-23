require_relative './database_connection'
require 'time'
require 'date'

class User

  def self.signup(name:, username:, email:, password:)
    DatabaseConnection.setup('chitter_database')
    DatabaseConnection.setup('chitter_database_test') if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.query("INSERT INTO makers_user (name, username, student_email, registration_date, registration_time)
                             VALUES ('#{name}', '#{username}', '#{email}', '#{Date.today.to_s}', '#{Time.now.strftime('%H:%M:%S')}');")
    student_id = DatabaseConnection.query("SELECT student_id FROM makers_user WHERE username='#{username}';")
    DatabaseConnection.query("INSERT INTO makers_passwords (password, student_id) VALUES ('#{password}', '#{student_id[0]['student_id']}');")
  end

  def self.export_user_data
    DatabaseConnection.query("SELECT * FROM makers_user;")
  end

end