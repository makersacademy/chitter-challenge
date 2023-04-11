require_relative 'user'

class UserRepository
  def create(user)
    sql = 'INSERT INTO users (name, email, username, password) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [user.name, user.email, user.username, user.password])

    return ''
  end
end