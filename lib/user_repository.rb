require_relative 'user'
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT id, name, email, username FROM users;'
    result = DatabaseConnection.exec_params(sql, [])
    user_array = []
    result.each do |row|
      user = User.new
      user.id, user.name, user.email, user.username = 
        row['id'].to_i, row['name'], row['email'], row['username']
      user_array << user
    end
    return user_array
  end

  def find(username)
    sql = 'SELECT id, name, email, username FROM users WHERE username = $1;'
    param = [username]
    result = DatabaseConnection.exec_params(sql, param)
    record = result.first
    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.email = record['email']
    user.username = record['username']
    return user
  end
  
  def create(user)
    # Executes the SQL query:
    sql = 'INSERT INTO users (name, email, username, password) VALUES ($1, $2, $3, $4);'
    params = [user.name, user.email, user.username, user.password]

    DatabaseConnection.exec_params(sql, params)
  
    return nil
  end

  def find_by_id(id)
    sql = 'SELECT id, name, email, username FROM users WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])
    record = result.first
    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.email = record['email']
    user.username = record['username']
    return user.username
  end

  def find_by_username(username)
    sql = 'SELECT id, name, email, username, password FROM users WHERE username = $1;'
    result = DatabaseConnection.exec_params(sql, [username])
    record = result.first
    user = User.new
    user.id = record['id']
    user.name = record['name']
    user.email = record['email']
    user.username = record['username']
    return user
  end
end
