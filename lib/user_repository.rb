require_relative "./database_connection.rb"
require_relative "./user.rb"
require 'bcrypt'

class UserRepository
    def all
        users = []

        sql = "SELECT id, username, password, name, email  FROM users;"
        result_set = DatabaseConnection.exec_params(sql, [])
        result_set.each do|record|
            user = User.new
            # user.id = record['id']
            user.name = record['name']
            user.username = record['username']
            user.password = record['password']
            user.email = record['email']
            
            users << user
        end
        return users
    end


    # Gets a single record by its ID
    # One argument: the id (number)
    def find(email)
        sql = "SELECT id, username, password, name, email FROM users WHERE email = $1;"
        # sql_params = [id]

        result_set = DatabaseConnection.exec_params(sql, [email])

        record = result_set[0]

        user = User.new
        user.id = record['id'].to_i
        user.name = record['name']
        user.username = record['username']
        user.enail= record['enail']
        user.password = record['password']

        return user
    end

  
    def create(user)
        encrypted_password = BCrypt::Password.create(user.password)
        sql = "INSERT INTO 
                users(username,password,email,name) 
                VALUES ($1, $2, $3, $4);"
        sql_params = [user.username, encrypted_password, user.email, user.name]

        DatabaseConnection.exec_params(sql, sql_params)

        return nil #?
    end

    def sign_in(email, submitted_password)
        user = find(email)

        return nil if user.nil?

        if BCrypt::Password.user(user.password) == submitted_password
            true
        else
            false
        end
    end
 
    # def delete(user)
    #     sql = "DELETE FROM users WHERE id = $1;"
    #     sql_params= [user]
        
    #     DatabaseConnection.exec_params(sql, sql_params)
    # end
end