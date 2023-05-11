require_relative 'user'
require 'bcrypt'

class UserRepository
  def create(user)  
    encrypted_password = BCrypt::Password.create(user.password)
    
    sql = '
    INSERT INTO users (email, password, name, username)
    VALUES($1, $2, $3, $4);'

    params = [user.email, encrypted_password, user.name, user.username]

    DatabaseConnection.exec_params(sql, params)
    
    
    # What happens if fails?
  end

  def find_by_email(email)
    sql = 'SELECT id, email, name, username
    FROM users
    WHERE email = $1;'

    params = [email]

    user = DatabaseConnection.exec_params(sql, params)
    
    return create_user(user[0])
  end

  private

  def create_user(record)
    user = User.new
    user.id = record['id']
    user.email = record['email']
    user.password = record['password']
    user.name = record['name']
    user.username = record['username']
    return user
  end
end
