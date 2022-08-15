require_relative 'user'

class UserRepository

    
    def all
        users = []
      # Executes the SQL query:
      sql = 'SELECT id, name, email FROM users;' 
      result_set = DatabaseConnection.exec_params(sql, [])

      result_set.each do |record|
        user = User.new
        user.id = record['id'].to_i
        user.name = record['name']
        user.email = record['email']
        users << user
        end
        return users
    
    end
    def find(id)
       # Executes the SQL query:
       sql = 'SELECT id, name, email FROM users where id = $1;'
       result_set = DatabaseConnection.exec_params(sql, [id])

       user = User.new
       user.id = result_set[0]['id'].to_i
       user.name = result_set[0]['name']
       user.email = result_set[0]['email']
       return user
    end
  
     def create(user)
       sql = 'INSERT INTO users (name, email) VALUES($1, $2);'
       result_set = DatabaseConnection.exec_params(sql, [user.name, user.email])
       return user
     end
  end