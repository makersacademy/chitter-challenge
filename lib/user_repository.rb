require_relative 'user'

class UserRepository
    def all
        users = []
        sql = 'SELECT id, name, username, email, password FROM users;'
        result = DatabaseConnection.exec_params(sql, [])

        result.each do |record|
            user = User.new
            user.id = record['id']
            user.name = record['name']
            user.username = record['username']
            user.email = record['email']
            user.password = record['password']

            users << user
        end
        return users
    end
    def create(new_user)
        sql = 'INSERT INTO users(name, username, email, password) VALUES($1, $2, $3, $4);'
        DatabaseConnection.exec_params(sql, [new_user.name, new_user.username, new_user.email, new_user.password])
    end
end