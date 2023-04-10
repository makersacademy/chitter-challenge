require_relative "./user"
require_relative "./database_connection"

class UserRepository
  def find_by_username(username)
    sql = 'SELECT * FROM users WHERE username = $1;'
    result = DatabaseConnection.exec_params(sql, [username]).first
    return nil if !result
    user = User.new
    user.id = result['id'].to_i
    user.username = result['username']
    user.name = result['name']
    user.email = result['email']
    user.password = result['password']
    return user
  end
end