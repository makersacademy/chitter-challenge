require_relative 'user'

class UserRepository
  def create(user)
    sql = 'INSERT INTO users (name, email, username, password) VALUES ($1, $2, $3, $4);'
    params = [user.name, user.email, user.username, user.password]
    result_set = DatabaseConnection.exec_params(sql, params)

    return ''
  end

  
end
