require 'user'

class UserRepository
  def all
    sql = "SELECT id, username, email, password FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])
    convert(result_set)
  end

  def find(id)
    sql = "SELECT id, username, email, password FROM users WHERE id=$1;"
    result_set = DatabaseConnection.exec_params(sql, [id])
    convert(result_set)
  end

  def create(user)
    sql = "INSERT INTO users(username, email, password) VALUES($1, $2, $3);"
    params = [user.username, user.email, user.password]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = "DELETE FROM users WHERE id=$1;"
    DatabaseConnection.exec_params(sql, [id])
  end

  private 

  def convert(result_set)
    users = []
    result_set.each do |record|
      user = User.new
      user.id = record["id"].to_i
      user.username = record["username"]
      user.email = record["email"]
      user.password = record["password"]
      users << user
    end
    users
  end
end