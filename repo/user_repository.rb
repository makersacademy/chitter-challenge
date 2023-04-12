require_relative '../models/user'

class UserRepository
  def create(user)
    sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4)'
    result_set = DatabaseConnection.exec_params(sql, [user.name, user.username, user.email, user.password])
    return user
  end

  def find_user_by_username(username)
    sql = 'SELECT * FROM users WHERE username = $1;'
    result_set = DatabaseConnection.exec_params(sql, [username])
    p result_set
    user = User.new
    user.user_id = result_set[0]['user_id']
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']
    user.password = result_set[0]['password']
    return user
  end

  def find_username_by_id(id)
    sql = 'SELECT username FROM users WHERE user_id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    print result_set
    return result_set[0]['username']
  end  
end