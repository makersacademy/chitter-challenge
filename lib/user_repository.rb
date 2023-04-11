require_relative 'user'
require 'bcrypt'

class UserRepository
  def create(new_user)
    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'
    params = [new_user.name, new_user.username, new_user.email, encrypted_password]
    DatabaseConnection.exec_params(sql, params)

    return new_user
  end

  def find_by_email(email)
    sql = 'SELECT id, name, username, email, password FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])

    user = User.new
    user.id = result_set[0]['id']
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']

    return user
  end

  def find(id)
    sql = 'SELECT id, name, username, email, password FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    user = User.new
    user.id = result_set[0]['id']
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']

    return user
  end
end
