require_relative './user'
require 'bcrypt'


class UserRepository

    def all
        users = []

        sql = 'SELECT id, name, username, email, password FROM users;'
        result_set = DatabaseConnection.exec_params(sql, [])
      
        result_set.each do |record|
           users << record_to_user_object(record)
        end
        return users
    end
  
    def record_to_user_object(record)
        user = User.new
        user.id = record['id'].to_i
        user.name = record['name']
        user.username = record['username']
        user.email = record['email']
        user.password= record['password']
        return user
    end

    def find(id)
        sql = 'SELECT id, name, username, email, password FROM users WHERE id = $1;'
        result_set = DatabaseConnection.exec_params(sql, [id])
        user = User.new
        user.id = result_set[0]['id'].to_i
        user.name = result_set[0]['name']
        user.username = result_set[0]['username']
        user.email = result_set[0]['email']
        user.password= result_set[0]['password']
        return user
    end
  
    def find_by_email(email)
        sql = 'SELECT id, name, username, email, password FROM users WHERE email = $1;'
        result_set = DatabaseConnection.exec_params(sql, [email])
        return nil if result_set.ntuples == 0
        user = User.new
        user.id = result_set[0]['id'].to_i
        user.name = result_set[0]['name']
        user.username = result_set[0]['username']
        user.email = result_set[0]['email']
        user.password= result_set[0]['password']
        return user

    end

    # def create(user)
    #     sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'
    #     result_set = DatabaseConnection.exec_params(sql, [user.name, user.username, user.email, user.password])
    #     return user
    # end

    def create(new_user)
        # Encrypt the password to save it into the new database record.
        encrypted_password = BCrypt::Password.create(new_user.password)
    
        sql = '
          INSERT INTO users (name, username, email, password)
            VALUES($1, $2, $3, $4);
        '
        sql_params = [
          new_user.name,
          new_user.username,
          new_user.email,
          encrypted_password
        ]
        result_set = DatabaseConnection.exec_params(sql, sql_params)
        return new_user
    end

    def log_in(email, submitted_password)
        user = find_by_email(email)
    
        return nil if user.nil?
    
        # Compare the submitted password with the encrypted one saved in the database
        stored_password = BCrypt::Password.new(user.password)
        if stored_password == submitted_password
          return  "login success"
        else
          return "wrong password"
        end
    end
end