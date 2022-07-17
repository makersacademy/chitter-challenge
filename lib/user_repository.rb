require_relative './user'

class UserRepository
    def all 
      sql = "SELECT * FROM users;"
      result_set = DatabaseConnection.exec_params(sql, [])
      users = []
      result_set.each do |record|
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
    
    def find_by_email(email)
      sql = 'SELECT id, name, username, email, password FROM users WHERE email = $1;'
      param = [email]
      result_set = DatabaseConnection.exec_params(sql, param)
      if result_set.to_a.empty?
        return nil
      else
        record = result_set[0]
        user = User.new
        user.id = record['id']
        user.name = record['name']
        user.username = record['username']
        user.email = record['email']
        user.password = record['password']
        return user
      end
    end

    def create(new_user)
      sql = 'INSERT INTO users (name, username, email, password) VALUES($1, $2, $3, $4);'
      param = [new_user.name, new_user.username, new_user.email, new_user.password]
      result_set = DatabaseConnection.exec_params(sql, param)
      return new_user
    end
end