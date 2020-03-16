require_relative './database_connection'

class User

    attr_reader :user_id, :name, :email, :password

    def initialize(user_id:, name:, email:, password:)
        @user_id = user_id
        @name = name
        @email = email
        @password = password
    end

    def self.create(user_id:, name:, email:, password:)
        result = DatabaseConnection.query("INSERT INTO users (user_id, name, email, password) VALUES('#{user_id}', '#{name}', '#{email}', '#{password}') RETURNING user_id, name, email, password;")
        @user = User.new(user_id: result[0]['user_id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
    end

    def self.current
        @user
    end

end