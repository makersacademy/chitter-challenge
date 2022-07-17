
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

  def find(username)
    sql = "SELECT * FROM users WHERE username = $1;"
    params = [username]
    result_set = DatabaseConnection.exec_params(sql, params)
    found_users = []
    result_set.each do |result|
      found_user = User.new
      found_user.id = result['id'].to_i
      found_users << found_user
    end
    return found_users[0].id
  end

  def match_username?(username)
    sql = "SELECT username FROM users WHERE username = $1;"
    params = [username]
    result_set = DatabaseConnection.exec_params(sql, params)
    result_set.each do |result|
      return true if username == result['username']
    end
    return false
  end
end
