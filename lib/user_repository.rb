require_relative 'user'

class UserRepository
    def all
        users = []

        sql = 'SELECT id, username, email, password FROM users'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            user = User.new
            user.id = record['id'].to_i
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

        return user
    end

    def find(id)
        sql = 'SELECT id, username, email, password FROM users WHERE id = $1;'
        result_set = DatabaseConnection.exec_params(sql, [id])

        user = User.new
        user.id = result_set[0]['id'].to_i
        user.username = result_set[0]['username']
        user.email = result_set[0]['email']
        user.password = result_set[0]['password']

        return user
    end

    def password(username)
        sql = 'SELECT id, username, password, email FROM users WHERE username = $1;'
        result_set = DatabaseConnection.exec_params(sql, [username])

        user = User.new
        user.id = result_set[0]['id'].to_i
        user.username = result_set[0]['username']
        user.password = result_set[0]['password']
        user.email = result_set[0]['email']

    return user
  end
end