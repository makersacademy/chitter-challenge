require_relative 'database_connection'
require 'bcrypt'

class User
    
    attr_reader :username, :name, :email, :id

    def initialize(id:, username:, name:, email:)
        @id = id
        @username = username
        @name = name
        @email = email
    end

    def self.create(username:, name:, password:, email:)
        encrypted_password = BCrypt::Password.create(password)

       users = DatabaseConnection.query("INSERT INTO users (username, name, password, email) VALUES ('#{username}', '#{name}', '#{password}', '#{email}') RETURNING id, username, name, password, email;") 
       User.new(id: users[0]['id'], username: users[0]['username'], name: users[0]['name'], email: users[0]['email'])
                
    end

    def self.find(id)
        return nil unless id
        user = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
        User.new(id: user[0]['id'], email: user[0]['email'], name: user[0]['name'], username: user[0]['username'])
    end



    def self.authenticate(username:, password:)
        
        user = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    
        
    
        User.new(id: user[0]['id'], email: user[0]['email'], name: user[0]['name'], username: user[0]['username'])
      end  
   

end