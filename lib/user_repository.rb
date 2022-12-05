require_relative "user"
require "bcrypt"

class UserRepository
  def find(id)
    sql = "SELECT id, name, username, password, email FROM users WHERE id = $1;"
    result_set = DatabaseConnection.exec_params(sql, [id])

    record = result_set[0]

    return record_to_user_object(record)
  end

  def find_by_email(email)
    sql = "SELECT id, name, username, password, email FROM users WHERE email = $1;"
    result_set = DatabaseConnection.exec_params(sql, [email])

    return nil if result_set.ntuples == 0

    record = result_set[0]

    return record_to_user_object(record)
  end

  def find_by_username(username)
    sql = "SELECT id, name, username, password, email FROM users WHERE username = $1;"
    result_set = DatabaseConnection.exec_params(sql, [username])

    return nil if result_set.ntuples == 0

    record = result_set[0]

    return record_to_user_object(record)
  end

  def create(user)
    sql = "INSERT INTO users (name, username, password, email) VALUES ($1, $2, $3, $4);"
    encrypted_password = BCrypt::Password.create(user.password)
    params = [user.name, user.username, encrypted_password, user.email]
    DatabaseConnection.exec_params(sql, params)

    return nil
  end

  private

  def record_to_user_object(record)
    user = User.new

    user.id = record["id"].to_i
    user.name = record["name"]
    user.username = record["username"]
    user.password = record["password"]
    user.email = record["email"]

    return user
  end
end
