require 'bcrypt'

class User
    def self.create(email:, password:, name:, username:)
      encrypted_password = BCrypt::Password.create(password)
  
      result = DatabaseConnection.query("INSERT INTO users (email, password, name, username) VALUES('#{email}', '#{encrypted_password}', '#{name}', '#{username}') RETURNING id, username;")
      User.new(
        id: result[0]['id'],  
        username: result[0]['username'],
      )
    end

    attr_reader :id, :username

    def initialize(id:, username:)
      @id = id
      @username = username
    end
end