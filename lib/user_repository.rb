require_relative './user.rb'

class UserRepository
  def all

  end

  def find(index)
    sql = 'SELECT * FROM users WHERE users.id = $1'
    result = DatabaseConnection.exec_params(sql, [index])[0]
    User.new(result[:username], result[:password], result[:name], result[:email])
  end

  def create(user)
    sql = 'INSERT INTO users (username, password, name, email) VALUES ($1, $2, $3, $4)'
    DatabaseConnection.exec_params(sql, [user.username, user.password, user.name, user.email])
  end
end