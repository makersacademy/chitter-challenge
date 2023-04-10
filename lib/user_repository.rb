require_relative "user"

class UserRepository
  def all
    users = []
    sql = "SELECT username, name, email, password FROM users"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      user = User.new
      user.username = record["username"]
      user.name = record["name"]
      user.email = record["email"]
      user.password = record["password"]
      users << user
    end
    return users
  end

  def create(user)
    # Encrypt the password for database
    encrypted_password = BCrypt::Password.create(user.password)

    sql = "INSERT INTO users (username, name, email, password) VALUES ($1, $2, $3, $4);"
    result_set = DatabaseConnection.exec_params(sql, [user.username, user.name, user.email, encrypted_password])

    return user
  end
end