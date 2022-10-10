require 'bcrypt'

class UserRepository

    def all
        query = "SELECT id, name, username, email FROM users;"
        params = []
        result_set = DatabaseConnection.exec_params(query, params)
        users = []
        
        result_set.each {|record| 
            user = User.new
            user.name = record["name"]
            user.id = record["id"]
            user.username = record["username"]
            user.email = record["email"]
            
            users << user
            p users
        }
        return users
     end


    def create(user)
        sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'

        params = [user.name, user.username, user.email, user.password]

        DatabaseConnection.exec_params(sql, params)
        return ''
    end

    def find_by_email(email)
        sql = 'SELECT * FROM users WHERE email = $1;'
        params = [email]
        result = DatabaseConnection.exec_params(sql, params)
        result = result.first
        user = User.new
        user.id = result['id']
        user.username = result['username']
        user.email = result['email']
        user.password = result['password']
        user.name = result['name']
        
        return user   
    end
    

    def find(id)
        sql = 'SELECT * FROM users WHERE id = $1;'
        params = [id]
        result_set = DatabaseConnection.exec_params(sql, params)
        result = result_set[0]
        user = User.new
        user.id = result['id']
        user.username = result['username']
        user.email = result['email']
        user.password = result['password']    
        user.name = result['name']

        return user
    end

    def sign_in(email, submitted_password)
        repository = UserRepository.new
        user = repository.find_by_email(email)
        return nil if user.nil?
        if BCrypt::Password.new(user.password) == submitted_password
          return user
        else
          return false
        end
      end

end
