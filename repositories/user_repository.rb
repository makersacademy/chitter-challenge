require_relative '../models/user'

class UserRepository

  def all
    query = <<~SQL
      SELECT * FROM users
    SQL

    result_set = DatabaseConnection.exec_params(query, [])

    result_set.map do |record|
      record["id"] = record["id"].to_i
      User.new(record)
    end
  end

  def find_by_id(id)
    query = <<~SQL
      SELECT * FROM users 
      WHERE id = $1;
    SQL

    params = [id]

    result_set = DatabaseConnection.exec_params(query, params)

    user = result_set.first
    return if user.nil?

    user["id"] = user["id"].to_i
    User.new(user)
  end

  def find_by_username(username)
    query = <<~SQL
      SELECT * FROM users 
      WHERE username = $1;
    SQL

    params = [username]

    result_set = DatabaseConnection.exec_params(query, params)

    user = result_set.first
    return if user.nil?

    user["id"] = user["id"].to_i
    User.new(user)
  end

  def create(user)
    query = <<~SQL
      INSERT INTO users (email, password_hash, name, username) 
      VALUES ($1, $2, $3, $4)
    SQL
    params = [user.email, user.password_hash, user.name, user.username]
    DatabaseConnection.exec_params(query, params)
  end
end
