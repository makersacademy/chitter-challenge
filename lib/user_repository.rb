require_relative 'user'
require_relative 'database_connection'
require 'bcrypt'

class UserRepository
  def all
    sql_query = 'SELECT id, name, email, pass_word, username FROM users'
    result_set = DatabaseConnection.exec_params(sql_query, [])

    all_users = []

    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.email = record['email']
      user.pass_word = record['pass_word']
      user.username = record['username']

      all_users << user
    end

    return all_users
  end

  def create(new_user)
    hashed_password = BCrypt::Password.create(new_user.pass_word)
    sql_query = 'INSERT INTO users (name, email, pass_word, username) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql_query, [new_user.name, new_user.email, hashed_password, new_user.username])
  end

  def find(email)
    sql_query = 'SELECT id, name, pass_word, username FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql_query, [email])
    
    if result_set.count == 0
      return nil
    end
    
    user = User.new
    user.id = result_set[0]['id'].to_i
    user.name = result_set[0]['name']
    user.pass_word = result_set[0]['pass_word']
    user.username = result_set[0]['username']
    
    return user
  end
end