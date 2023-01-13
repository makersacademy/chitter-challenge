require_relative './user'

class UserRepository

    def all
      sql = 'SELECT id, name, email, password FROM users;'
      result_set = DatabaseConnection.exec_params(sql,[])
  
      users = []

      result_set.each do |record|
        user = User.new
        user.id = record['id']
        user.name = record['name']
        user.email = record['email']
        user.password = record['password']

        users << user
      end
      return users
    end
  
    
    def find(email)
      sql = 'SELECT * FROM users WHERE email = $1;'
      result_set = DatabaseConnection.exec_params(sql,[email])

      user = User.new
      user.id = result_set[0]['id']
      user.name = result_set[0]['name']
      user.email = result_set[0]['email']
      user.password = result_set[0]['password']
  
      return user
    end
  
    def sign_in(user)
      sql = 'INSERT INTO users (name, email, password) VALUES ($1, $2, $3);'
      result_set = [user.name, user.email, user.password]
      DatabaseConnection.exec_params(sql, result_set)
     
    end
  end