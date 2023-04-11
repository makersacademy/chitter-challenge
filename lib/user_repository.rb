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

  def username_exists?(username)
    sql = "SELECT username FROM users WHERE username = $1;"
    res = DatabaseConnection.exec_params(sql, [username])
    if res.num_tuples.zero?
      return false
    end
    return true
  end

  def email_exists?(email)
    sql = "SELECT email FROM users WHERE email = $1;"
    res = DatabaseConnection.exec_params(sql, [email])
    if res.num_tuples.zero?
      return false
    end
    return true
  end

  def find(email)
    sql = 'SELECT id, username, password FROM users WHERE email = $1;'
    res = DatabaseConnection.exec_params(sql, [email])
    
    if res.num_tuples.positive?
      user = User.new
      user.id = res[0]['id']
      user.username = res[0]['username']
      user.password = res[0]['password']
      return user
    else
      return nil
    end
  end
end