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
      email_check = DatabaseConnection.query("SELECT * FROM users")
    end
end