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

  def find(method, value)
    query = <<~SQL
      SELECT * FROM users 
      WHERE #{method} = $1;
    SQL

    params = [value]

    result_set = DatabaseConnection.exec_params(query, params)

    user = result_set.first
    return if user.nil?

    user["id"] = user["id"].to_i
    User.new(user)
  end

  def create(user)
    query = <<~SQL
      INSERT INTO users (email, password, name, username) 
      VALUES ($1, $2, $3, $4)
    SQL
    params = [user.email, user.password, user.name, user.username]
    puts DatabaseConnection.exec_params(query, params)
  end
end
