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
    
    def find(id)
      sql = 'SELECT id, name, username, email, password FROM users WHERE id = $1;'
      param = [id]
      result_set = DatabaseConnection.exec_params(sql, param)
      record = result_set[0]
        user = User.new
        user.id = record['id']
        user.name = record['name']
        user.username = record['username']
        user.email = record['email']
        user.password = record['password']
      return user
    end

    def create(new_user)
      sql = 'INSERT INTO users (name, username, email, password) VALUES($1, $2, $3, $4);'
      param = [new_user.name, new_user.username, new_user.email, new_user.password]
      result_set = DatabaseConnection.exec_params(sql, param)
      return ''
    end
end