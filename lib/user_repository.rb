require_relative 'user'
require 'bcrypt'

class UserRepository

  def create(new_user)

    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = 'INSERT INTO users (name, username, email, password) VALUES($1, $2, $3, $4);'
    sql_params = [
      new_user.name,
      new_user.username,
      new_user.email,
      encrypted_password
    ]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end

  def find_by_username(username)
    sql = 'SELECT id, name, username, email, password FROM users WHERE username = $1;'
    result_set = DatabaseConnection.exec_params(sql, [username])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']

    return user
  end

  def all
    users = []

    sql = 'SELECT id, name, username, email, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|

      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.username = record['username']
      user.email = record['email']
      user.password = record['password']

      users << user
    end

    return users
  end
end
