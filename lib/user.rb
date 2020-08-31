require_relative 'database_connection'

class User
    
    attr_reader :username, :name, :email, :id

    def initialize(id:, username:, name:, email:)
        @id = id
        @username = username
        @name = name
        @email = email
    end

    def self.create(username:, name:, password:, email:)
       users = DatabaseConnection.query("INSERT INTO users (username, name, password, email) VALUES ('#{username}', '#{name}', '#{password}', '#{email}') RETURNING id, username, name, password, email;")
       users.map { |user| 
                   User.new(id: user['id'], username: user['username'], name: user['name'], email: user['email'])
                }
    end

    def self.current_user
        users = DatabaseConnection.query("SELECT * FROM users")
        all = users.map { |user|
        User.new(id: user['id'], username: user['username'], name: user['name'], email: user['email'])
        }
        all.last.username
    end
end