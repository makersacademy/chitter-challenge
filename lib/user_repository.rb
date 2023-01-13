require 'user'
require 'bcrypt'

class UserRepository
    def all
        users = []
        sql = 'SELECT id, name, username FROM users;'
        result_set = DatabaseConnection.exec_params(sql, [])
        
        result_set.each do |record|
            user = User.new
            user.id = record['id'].to_i
            user.name = record['name']
            user.username = record['username']
            users << user
        end

        return users
    end

    def find(id)
        sql = 'SELECT name, username FROM users WHERE id = $1;'
        result_set = DatabaseConnection.exec_params(sql, [id])
        user = User.new
        user.name = result_set.first['name']
        user.username = result_set.first['username']
        return user
    end

    def create(user)
        # user.password_hash = BCrypt::Password.create(user.password)
        sql = 'INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3, $4);'
        params = [
            user.email, 
            user.password_hash, 
            user.name, 
            user.username
        ]
        DatabaseConnection.exec_params(sql, params)
    end

    def find_by_email(email)
        sql = 'SELECT password FROM users WHERE email = $1;'
        result_set = DatabaseConnection.exec_params(sql, [email])
        user = User.new
        user.password_hash = result_set.first['password']
        return user
    end
end