require_relative 'database_connection'
require_relative 'user'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []
    result_set.each do |row|
      user = User.new
      user.id = row['id']
      user.username = row['username']
      user.email = row['email']
      user.password_hash = row['password_hash']
      users << user
    end
    return users
  end
end