require_relative 'user'

class UserRepository

    def find(email)

      sql = 'SELECT id, name, username, email, password FROM users WHERE email = $1;'
      result_set = DatabaseConnection.exec_params(sql, [email])

      if result_set.ntuples == 0
        return nil
      end

        user = User.new

        user.id = result_set[0]['id'].to_i
        user.name = result_set[0]['name']
        user.username = result_set[0]['username']
        user.email = result_set[0]['email']
        user.password = result_set[0]['password']

        return user
    end

    def does_username_exist(username)
        sql = 'SELECT id, name, username, email, password FROM users WHERE username = $1;'
        result_set = DatabaseConnection.exec_params(sql, [username])
        if result_set.ntuples == 0
          return false
        else
          return true
        end
    end

    def create(user)
        sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4) RETURNING id;'
        params = [user.name, user.username, user.email, user.password]
      
        result_set = DatabaseConnection.exec_params(sql, params)
        user.id = result_set[0]['id']
      
        return user
    end
end