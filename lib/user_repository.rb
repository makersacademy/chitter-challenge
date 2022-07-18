require_relative 'database_connection'
require_relative 'user'
require 'bcrypt'

class UserRepository

    def all
        sql = 'SELECT id, name, email, password FROM users;'
        result_set = DatabaseConnection.exec_params(sql,[])
        users = []
        result_set.each do |result|
            user = User.new
            user.id = result['id']
            user.name = result['name']
            user.email = result['email']
            user.password = result['password']
            users << user
        end
        users
    end

    def find_by_email(email)
        sql = 'SELECT id, name, email, password FROM users WHERE email=$1;'
        sql_param = [email]
        result = DatabaseConnection.exec_params(sql,sql_param)
        if result.cmd_tuples == 0
            return nil
        else 
            user = User.new
            user.id = result[0]['id']
            user.name = result[0]['name']
            user.email = result[0]['email']
            user.password = result[0]['password']
            return user
        end
    end

    def create(new_user)
        encrypted_password = BCrypt::Password.create(new_user.password)

        sql = 'INSERT INTO users (name, email, password) VALUES($1, $2, $3);'
        sql_params = [new_user.name,new_user.email,encrypted_password]
        DatabaseConnection.exec_params(sql,sql_params)

    end

    def sign_in(email, submitted_password)
        user = find_by_email(email)
    
        return nil if user.nil?
    
        #encrypted_submitted_password = BCrypt::Password.create(user.password)
    
        if BCrypt::Password.new(user.password) == submitted_password
          return true
        else
          return false
        end
      end
end