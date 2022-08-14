require 'bcrypt'
require_relative 'user'

class UserRepository
  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)

    sql = 'INSERT INTO users (email, password, name, username) VALUES($1, $2, $3, $4);'
    params = [user.email, encrypted_password, user.name, user.username]
    DatabaseConnection.exec_params(sql, params)
  end

  # def sign_in(email, submitted_password)
  #   user = find_by_email(email)

  #   return nil if user.nil?

  #   p encrypted_submitted_password = BCrypt::Password.create(submitted_password)
  #   p user.password

  #   return user.password == BCrypt::Password.new(encrypted_submitted_password)
  # end

  def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1;'
    params = [email]
    result = DatabaseConnection.exec_params(sql, params)[0]

    user = User.new
    user.id = result['id']
    user.email = result['email']
    user.password = result['password']
    user.name = result['name']
    user.username = result['username']
    
    return user
  end
end