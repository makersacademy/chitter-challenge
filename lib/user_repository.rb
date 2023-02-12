require_relative 'user'
require 'database_connection'

class UserRepository

    def all
        #this should list them in reverse chronological order so this method can be called to the homepage
        users = []
        sql = 'SELECT id, username, email_address, password FROM users;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            user = User.new
            user.id = record['id'].to_i
            user.username = record['username']
            user.email_address = record['email_address']
            user.password = record['password'].to_i

            users << user
        end
        return users
    end


    def find(id)
        sql = 'SELECT id, username, email_address, password FROM users WHERE id = $1;'
        result_set = DatabaseConnection.exec_params(sql, [id])

        user = User.new
        user.id = result_set[0]['id'].to_i
        user.username = result_set[0]['username']
        user.email_address = result_set[0]['email_address']
        user.password = result_set[0]['password'].to_i
    return user
end

def create(user)
  sql = 'INSERT INTO users (username, email_address, password) VALUES ($1, $2, $3);'
  result_set = DatabaseConnection.exec_params(sql, [user.username, user.email_address, user.password])

  return user
end

end
