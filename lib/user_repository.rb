require 'user'

class UserRepository
  def find(email)
    sql = 'SELECT id, username, email, password FROM users WHERE email = $1'
    result_set = DatabaseConnection.exec_params(sql, [email])
    user = User.new
    user.id = result_set[0]['id']
    user.username = result_set[0]['username']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
    return user
  end

  def create(user)

  end

  def sign_in(email, submitted_password)

  end
end