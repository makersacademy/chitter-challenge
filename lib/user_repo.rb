require 'database_connection'
require_relative 'user'

class UserRepo
  def all
    users = []
    sql = "SELECT * FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |result|
      user = User.new
      user.username = result['username']
      user.password = result['password']
      users << user
    end
    return users
  end

  def create_user(user)
    sql = 'INSERT INTO users (username, password) VALUES ($1, $2);'
    params = [user.username, user.password]
    result_set = DatabaseConnection.exec_params(sql, params)
    return user
  end
end
