require_relative 'user'

class UserRepository
  def create(user)
    sql = 'INSERT INTO users (name, email, username, password) VALUES ($1, $2, $3, $4);'
    params = [user.name, user.email, user.username, user.password]
    result_set = DatabaseConnection.exec_params(sql, params)

    return ''
  end

  def find_by_id(id) # returns a boolean
    sql = 'SELECT * FROM users WHERE id = $1'
    result = DatabaseConnection.exec_params(sql, [id])

    assign_user_attributes(result)

  end

  def find_by_username(username) # returns a boolean
    sql = 'SELECT * FROM users WHERE username = $1'
    result = DatabaseConnection.exec_params(sql, [username])

    assign_user_attributes(result)

  end

  def find_by_email(email)  # returns a boolean
    sql = 'SELECT * FROM users WHERE email = $1'
    result = DatabaseConnection.exec_params(sql, [email])

    assign_user_attributes(result)

  end

  def email_unique?(email)  # returns a boolean
    sql = 'SELECT * FROM users WHERE email = $1'
    result = DatabaseConnection.exec_params(sql, [email])

    result.ntuples.zero?
  end

  def username_unique?(username)  # returns a boolean
    sql = 'SELECT * FROM users WHERE username = $1'
    result = DatabaseConnection.exec_params(sql, [username])

    result.ntuples.zero?
  end

  def assign_user_attributes(result)
    user_result = result[0]
    user = User.new
    user.id = user_result["id"].to_i
    user.name = user_result["name"]
    user.email = user_result["email"]
    user.username = user_result["username"]
    user.password = user_result["password"]

    return user
  end

  
end
