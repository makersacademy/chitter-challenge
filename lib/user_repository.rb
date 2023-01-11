require_relative 'user'
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT * FROM users'
    results = DatabaseConnection.exec_params(sql, [])
    users = []
    results.each do |result|
      user = User.new
      user.id = result['id'].to_i
      user.username = result['username']
      user.email = result['email']
      user.password = result['password']
      users << user
    end
    users
  end

  def create(user)
    sql = "INSERT INTO users (username, email, password) VALUES ($1, $2, $3);"
    params = [user.username, user.email, BCrypt::Password.create(user.password)]
    DatabaseConnection.exec_params(sql, params)
  end
end
