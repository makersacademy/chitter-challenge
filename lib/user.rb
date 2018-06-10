require 'bcrypt'
require 'database_connection'
class User

    attr_reader :id, :display_name, :username, :email, :password
    def initialize(id, display_name, username, email, password)
        @id = id
        @display_name = display_name
        @username = username
        @email = email
        @password = password
    end

    def self.all
        result = DatabaseConnection.query("SELECT * FROM users")
        result.map {|user| User.new(user['id'], user['display_name'], user['username'], user['email'], user['password'])}
    end

    def self.create options
        password = BCrypt::Password.create(options[:password])
        result = DatabaseConnection.query("INSERT INTO users (display_name, username, email, password) VALUES('#{options[:display_name]}', '#{options[:username]}', '#{options[:email]}', '#{password}') RETURNING id, display_name, username, email, password")
        
        User.new(result.first['id'], result.first['display_name'], result.first['username'], result.first['email'], result.first['password'])
    end

    def self.find(id)
        return nil unless id
        result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
        User.new(result.first['id'], result.first['display_name'], result.first['username'], result.first['email'], result.first['password'])
    end
end