require 'user'
require 'bcrypt'

class UserRepository
  def find(email)
    sql = 'SELECT id, username, email, password FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])
   
    # checks if the result set is empty
    if result_set.ntuples == 0
      return nil
    end
    user = User.new
    user.id = result_set[0]['id']
    user.username = result_set[0]['username']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
    return user
  end

  def create(user)
    sql = 'INSERT INTO users (username, email, password) VALUES ($1, $2, $3);'
    encrypted_password = BCrypt::Password.create(user.password)
    params = [user.username, user.email, encrypted_password]
    DatabaseConnection.exec_params(sql, params)

    return nil
  end

  def login(email, submitted_password)
    user = find(email)
    if user.nil?
      return nil # 'Email or password are incorrect'
    end

    if BCrypt::Password.new(user.password) == submitted_password
      return user.id
    else
      return nil # Email or password are incorrect
    end
  end
end