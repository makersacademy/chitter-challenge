require_relative './user'
require 'bcrypt'

class UserRepository

    def all
        users = []

        sql = 'SELECT id, name, username, email, password FROM users;'
        result_set = DatabaseConnection.exec_params(sql, [])
        
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

    def create(user)
      sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'

      encrypted_password = BCrypt::Password.create(user.password)

      sql_params = [user.name, user.username, user.email, encrypted_password]

      result = DatabaseConnection.exec_params(sql, sql_params)
    
      return nil
    end

    

    def find(id)
        sql = 'SELECT id, name, username FROM users WHERE id = $1;'
        result = DatabaseConnection.exec_params(sql, [id])
        record = result[0]

        user = User.new
        user.id = record['id']
        user.name = record['name']
        user.username = record['username']

        return user
    end

    def find_with_peeps(id)
      sql = 'SELECT posts.id, posts.peep, posts.time
              FROM posts
              JOIN users ON posts.user_id = users.id
              WHERE users.id = $1;'
      
      result = DatabaseConnection.exec_params(sql, [id])
    end

    def sign_in(email, submitted_password)
      user = find_by_email(email)

      return nil if user.nil?

      encrypted_password = BCrypt::Password.new(user.password)
      password = user.password

      if encrypted_password == submitted_password
        return true
      # elsif password == submitted_password
      #   return true
      else
        return false
      end
    end

    def find_by_email(email)
      sql = 'SELECT id, name, username, email, password 
            FROM users 
            WHERE users.email = $1;'
      
      sql_params = [email]

      result = DatabaseConnection.exec_params(sql, sql_params)

      record = result[0]

      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.username = record['username']
      user.email = record['email']
      user.password = record['password']

      return user
    end
end 