require 'pg'
require './lib/database_connection'
require_relative '../database_connection_setup.rb'
class User
attr_reader :id, :name, :email, :username, :password

    def initialize(id:, name:, email:, username:, password:)
        @id = id
        @name = name
        @email = email
        @username = username
        @password = password
    end

    def self.newuser(id:, username:, password:, name:, email:)
      user = DatabaseConnection.query("INSERT INTO users (username, password, name, email) VALUES('#{username}', '#{password}', '#{name}','#{email}') RETURNING id, name, email, username, password;")
      User.new(id: user[0]['id'], name: user[0]['name'], email: user[0]['email'], username: user[0]['username'], password: user[0]['password'])
    end

    def self.check_email(email)
      email_check = DatabaseConnection.query("SELECT * FROM users WHERE email='#{email}';")
      print email_check
      # check = email_check.map do |user|
      #    true if user['login_email'] == email
      # end
      
      true
      # check[0]
    end
  
    def self.check_password(login_email:, login_password:)
      if check_email(email: login_email) == true
        p "email check green"
        password_check = DatabaseConnection.query("SELECT * FROM users WHERE email='#{login_email}';")
      else
        false
      end
    end

    def self.find(email:)
      result = DatabaseConnection.query("SELECT * FROM users WHERE email='#{email}';")
      User.new(id: result[0]['id'], username: result[0]['username'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
    end
end
