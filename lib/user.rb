
class User

    def self.create(user_name:, email:, password:)
        result = DatabaseConnection.query("SELECT FROM users WHERE user_name = '#{user_name}';")
        if result.first != nil
            @error = 'user_name'
            return false
        else result = DatabaseConnection.query("SELECT FROM users WHERE email = '#{email}';")
            if result.first != nil
                @error = 'email'
                return false
            end
        end
        user = DatabaseConnection.query("INSERT INTO users (user_name, email, password) VALUES ('#{user_name}', '#{email}', '#{password}') RETURNING *;").first
        @user = User.new(id: user['id'],user_name: user['user_name'])
    end

    def self.logged_in
        @user
    end

    def self.error
        @error
    end

    attr_reader :id, :user_name

    def initialize(id:, user_name:)
        @id = id
        @user_name = user_name
    end

end