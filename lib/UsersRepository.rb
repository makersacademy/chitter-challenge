require "user"

class UsersRepository
  
  
  def all
    sql = "SELECT * FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []
    result_set.each do |object|
        user = User.new
        user.id = object["id"]
        user.username = object["username"]
        user.email = object["email"]
        user.password = object["password"]
        users << user
    end
    return users
  end


  def find(id)
    sql = "SELECT * FROM users WHERE id = $1;"
    result_set = DatabaseConnection.exec_params(sql, [id])
    users = []
    result_set.each do |object|
        user = User.new
        user.id = object["id"]
        user.username = object["username"]
        user.email = object["email"]
        user.password = object["password"]
        users << user
    end
    return users.first
  end

  def create(user)
    sql = "INSERT INTO users(username, email, password) VALUES($1, $2, $3);"
    params = [user.username, user.email, user.password]
    DatabaseConnection.exec_params(sql, params)
  end

  def update(user)
    sql = "UPDATE users SET username = $1, email = $2, password = $3 WHERE id = $4;"
    params = [user.username, user.email, user.password, user.id]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(user)
    sql = "DELETE FROM users WHERE id = $1;"
    DatabaseConnection.exec_params(sql, [user.id])
  end
end