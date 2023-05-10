require_relative '../lib/user'
require 'date'
require 'bcrypt'

class UserRepository

  def all
    
    sql = 'SELECT id, email, password, name, username FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []

    result_set.each do |record|
      user = User.new

      user.id = record['id'].to_i
      user.email = record['email']
      user.password = record['password']
      user.name = record['name']
      user.username = record['username']

      
      users << user
    end

    return users
  end

  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)
    sql = 'INSERT INTO users (email, password, name, username) VALUES($1, $2, $3, $4);'
    params = [user.email, encrypted_password, user.name, user.username]
    record = DatabaseConnection.exec_params(sql, params)

    return nil
  end

  def find_by_user_id(user_id)
    sql = 'SELECT id, email, password, name, username FROM users WHERE id = $1'
    result_set = DatabaseConnection.exec_params(sql, [user_id])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']

    return user
  end

  def find_by_email(email)
    sql = 'SELECT id, email, password, name, username FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])

    if result_set.ntuples.zero?
      return ''
    end

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']

    return user
  end
end