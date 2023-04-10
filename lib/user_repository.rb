require_relative 'user'
require 'bcrypt'

class UserRepository
    def all
        users = []
    
        # Send the SQL query and get the result set.
        sql = 'SELECT id, email, password, username, name FROM users;'
        result = DatabaseConnection.exec_params(sql,[])
        
        # The result set is an array of hashes.
        # Loop through it to create a model
        # object for each user data hash.
        result.each do |user_data|
    
            # Create a new model object
            # with the user_data.
            user = User.new
            user.id = user_data['id'].to_i
            user.email = user_data['email']
            user.password = user_data['password']
            user.username = user_data['username']
            user.name = user_data['name']

            users << user
        end
        return users
    end

    def create(new_user)
        # Encrypt the password to save it into the new database record.
        encrypted_password = BCrypt::Password.create(new_user.password)
    
        sql = '
            INSERT INTO users (email, password, username, name)
            VALUES($1, $2, $3, $4);
        '
        params = [
            new_user.email,
            encrypted_password,
            new_user.username,
            new_user.name
        ]

        result = DatabaseConnection.exec_params(sql, params)
    end

    def find(email)
        sql = 'SELECT id, email, password, username, name FROM users WHERE email = $1;'
        result = DatabaseConnection.exec_params(sql, [email])
        
        return nil if result.ntuples == 0

        user = User.new
        # binding.irb
        user.id = result[0]['id'].to_i
        user.email = result[0]['email']
        user.password = result[0]['password']
        user.username = result[0]['username']
        user.name = result[0]['name']
    
        return user
    end

    def find_from_session(session_id)
        sql = 'SELECT id, email, password, username, name FROM users WHERE username = $1;'
        result = DatabaseConnection.exec_params(sql, [session_id])
         
        user = User.new
        user.id = result[0]['id'].to_i
        user.email = result[0]['email']
        user.password = result[0]['password']
        user.username = result[0]['username']
        user.name = result[0]['name']
    
        return user
    end

    def sign_in(email, submitted_password)
        user = find(email)
    
        return nil if user.nil?
        # binding.irb
        # Compare the submitted password with the encrypted one saved in the database
        stored_password = BCrypt::Password.new(user.password)
        if stored_password == submitted_password
            return true
        else
            return false
        end
    end
end
