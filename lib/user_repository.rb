require 'user_repository'
require 'user_model'

class UserRepository
  def all
    sql = 'SELECT id, first_name, last_name, user_name, user_email FROM users;'
    result = DatabaseConnection.exec_params(sql, [])
    user_list = []
    result.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.first_name = record['first_name']
      user.last_name = record['last_name']
      user.user_name = record['user_name']
      user.user_email = record['user_email']
      user_list << user
    end
    return user_list
  end
  
  def find(id)
    sql = 'SELECT id, first_name, last_name, user_name, user_email FROM users WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])
    record = result[0]
    user = User.new
    user.id = record['id'].to_i
    user.first_name = record['first_name']
    user.last_name = record['last_name']
    user.user_name = record['user_name']
    user.user_email = record['user_email']
    return user
  end
  
  def create(user)
    sql = 'INSERT INTO users (first_name, last_name, user_name, user_email) VALUES ($1, $2, $3, $4);'
    params = [user.first_name, user.last_name, user.user_name, user.user_email]
    result = DatabaseConnection.exec_params(sql, params)
    return nil
  end
  
  def update(user)
    sql = 'UPDATE users SET first_name = $1, last_name = $2, user_name = $3, user_email = $4;'
    params = [user.first_name, user.last_name, user.user_name, user.user_email]
    result = DatabaseConnection.exec_params(sql, params)
    return nil
  end
  
  def delete_user(id)
    sql = 'DELETE FROM users WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])
    return nil
  end
  end
