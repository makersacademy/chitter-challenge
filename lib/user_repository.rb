require_relative 'user'

class UserRepository
  def create(user)
    sql = 'INSERT INTO users (name, email, username, password) VALUES ($1, $2, $3, $4);'
    params = [user.name, user.email, user.username, user.password]
    result_set = DatabaseConnection.exec_params(sql, params)

    return ''
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

  
end
