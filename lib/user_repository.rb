require_relative './user.rb'

class UserRepository
  def all

  end

  def find

  end

  def create(user)
    sql = 'INSERT INTO users (username, password, name, email) VALUES ($1, $2, $3, $4)'
    DatabaseConnection.exec_params(sql, [user.username, user.password, user.name, user.email])
  end
end