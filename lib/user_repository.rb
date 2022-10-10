require_relative './user.rb'

class UserRepository
  def all
    sql = "SELECT * FROM users"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.map do |user|
      User.new(user["username"], user["password"], user["name"], user["email"])
    end
  end

  def find(index)
    sql = 'SELECT * FROM users WHERE users.id = $1'
    result = DatabaseConnection.exec_params(sql, [index])[0]
    User.new(result["username"], result["password"], result["name"], result["email"])
  end

  def create(user)
    sql = 'INSERT INTO users (username, password, name, email) VALUES ($1, $2, $3, $4)'
    DatabaseConnection.exec_params(sql, [user.username, user.password, user.name, user.email])
  end

  def login?(user)
    database_users = self.all
    database_users.any? do |database_user|
      database_user == user
    end
  end

  def get_user_id(username)
    sql = "SELECT id FROM users WHERE username = $1"
    DatabaseConnection.exec_params(sql, [username])[0]["id"]
  end
end