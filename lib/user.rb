require_relative 'database_connection'
require 'bcrypt'

class User

attr_reader :id, :username, :email

    def initialize(id, username, email)
        @id = id 
        @username = username
        @email = email
    end


    def self.create(username, email, password)
        encrypted_password = BCrypt::Password.create(password)
        result = DatabaseConnection.query( "INSERT INTO user_list(username, email, password) VALUES('#{username}', '#{email}', '#{encrypted_password}') RETURNING id, username, email")
        User.new(result[0]['id'], result[0]['username'], result[0]['email'])
    end

    def self.find(id)
        return nil unless id
        result = DatabaseConnection.query("SELECT * FROM user_list WHERE id = '#{id}'")
        User.new(result[0]['id'], result[0]['username'], result[0]['email']) 
    end

    def self.authenticate(email, password)
        result = DatabaseConnection.query("SELECT * FROM user_list WHERE email = '#{email}'")
        return unless result.any?
        return unless BCrypt::Password.new(result[0]['password']) == password
        User.new(result[0]['id'], result[0]['username'], result[0]['email'])
    end
end