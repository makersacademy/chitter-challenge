require_relative 'user'
require 'bcrypt'

class UserRepository
  def find(email)
    sql = 'SELECT id, username, email, password FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])
   
    # checks if the result set is empty, i.e. the email is unknown
    if result_set.ntuples == 0
      return nil
    end
    user = User.new
    user.id = result_set[0]['id']
    user.username = result_set[0]['username']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
    return user
  end

  def username_exist?(username)
    sql = 'SELECT id, username, email, password FROM users WHERE username = $1;'
    result_set = DatabaseConnection.exec_params(sql, [username])
    if result_set.ntuples == 0
      return false
    else
      return true
    end
  end

  def create(user)
    sql = 'INSERT INTO users (username, email, password) VALUES ($1, $2, $3);'
    encrypted_password = BCrypt::Password.create(user.password)
    params = [user.username, user.email, encrypted_password]
    DatabaseConnection.exec_params(sql, params)

    return nil
  end

end