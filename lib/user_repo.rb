require 'user'

class UserRepository
    def initialize

    end

    def all
        users = []
        sql = 'SELECT id, username, email, password FROM users;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            user = User.new
            user.id = record['id']
            user.username = record['username']
            user.email = record['email']
            user.password = record['password']
            users << user
        end

        return users
    end

    def create(user)
        sql = 'INSERT INTO users (username, email, password) VALUES ($1, $2, $3);'
        result_set = DatabaseConnection.exec_params(sql, [user.username, user.email, user.password])
        # Could have it return the user if I wanted to say user created
    end

end
