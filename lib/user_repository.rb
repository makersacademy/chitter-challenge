require 'user'
require 'bcrypt'

class UserRepository
    def all
        users = []
        sql = 'SELECT * FROM users;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            user = User.new
            user.id = record['id']
            user.name = record['name']
            user.username = record['username']
            user.email = record['email']
            user.password_hash = record['password_hash']
            users << user
        end
        return users
    end

    def find(id)
        sql = 'SELECT * FROM users WHERE id = $1'
        result_set = DatabaseConnection.exec_params(sql, [id])
        record = result_set.first
        user = User.new
        user.id = record['id']
        user.name = record['name']
        user.username = record['username']
        user.email = record['email']
        user.password_hash = record['password_hash']
        return user
    end

    def create(user)
        sql = 'INSERT INTO users (name, username, email, password_hash) VALUES ($1, $2, $3, $4);'
        params = [user.name, user.username, user.email, user.password_hash]
        DatabaseConnection.exec_params(sql, params)
        return nil
    end

    def find_by_email(email)
        sql = 'SELECT password_hash FROM users WHERE email = $1'
        result_set = DatabaseConnection.exec_params(sql, [email])
        user = User.new
        user.password_hash = result_set.first['password_hash']
        return user
    end
end