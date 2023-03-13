require 'bcrypt'
require_relative 'user'

class UserRepository

  def all

      users = []
  
      sql = 'SELECT id, username, password FROM users;'
      result_set = DatabaseConnection.exec_params(sql, [])
  
      result_set.each do |record|
        user = User.new
  
        user.id = record['id'].to_i
        user.username = record['username']
        user.password = record['password']
  
        users << user
      end

      return users
  end

  def create(user)

    hash_pass = BCrypt::Password.create(user.password)

    sql = 'INSERT INTO users (username, password) VALUES ($1, $2);'
    params = [user.username, hash_pass]

    DatabaseConnection.exec_params(sql, params)
    
    return nil
  end

  def find(id)
    
    sql = 'SELECT id, username, password FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.username = result_set[0]['username']
    user.password = result_set[0]['password']

    return user
  end
end