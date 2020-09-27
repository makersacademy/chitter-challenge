require_relative 'database_connection'

class User

attr_reader :id, :username, :email

    def initialize(id, username, email)
        @id = id 
        @username = username
        @email = email
    end


    def self.create(username, email, password)
        result = DatabaseConnection.query( "INSERT INTO user_list(username, email, password) VALUES('#{username}', '#{email}', '#{password}') RETURNING id, username, email")
        User.new(result[0]['id'], result[0]['username'], result[0]['email'])
    end

    def self.find(id)
        return nil unless id
        result = DatabaseConnection.query("SELECT * FROM user_list WHERE id = '#{id}'")
        User.new(result[0]['id'], result[0]['username'], result[0]['email'])
   
    
    end
end