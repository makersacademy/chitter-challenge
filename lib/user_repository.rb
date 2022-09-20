# file: lib/user_repository.rb
require 'user'
require 'bcrypt'

class UserRepository

  def initialize
        @logged_in = false
  end

  def create(new_user)
    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = '
      INSERT INTO users (email, name, username, password)
        VALUES($1, $2, $3, $4);
    '
    sql_params = [
      new_user.email,
      new_user.name,
      new_user.username,
      encrypted_password
    ]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?

    encrypted_submitted_password = BCrypt::Password.new(submitted_password)

    if user.password == encrypted_submitted_password
        @logged_in = true
    else
       puts 'password is incorrect' 
       @logged_in = false
    end
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users where email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])
    
    user = User.new
    user.id = result_set[0]['id'].to_i
    user.email = result_set[0]['email']
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']
    user.password = result_set[0]['password']

    return user
  end
end