require_relative 'database_connection'
require_relative 'user'
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []
    result_set.each do |row|
      user = User.new
      user.id = row['id']
      user.username = row['username']
      user.email = row['email']
      user.password = row['password']
      users << user
    end
    
    return users
  end

  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)
  
    sql = '
      INSERT INTO users (username, email, password)
        VALUES($1, $2, $3);
    '
    sql_params = [
      user.username,
      user.email,
      encrypted_password
    ]
    DatabaseConnection.exec_params(sql, sql_params)
  
    return nil
  end

  def find_by_email(email)
    sql = 'SELECT username FROM users WHERE email = $1;'
    params = [email]
    result = DatabaseConnection.exec_params(sql, params)
    
    if result.ntuples > 0
      record = result[0]
      user = User.new
      user.username = record['username']
      user.email = record['email']
      user.password = record['password']
      return user
    else
      fail 'No such user with given email.'
    end
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?

    # Compare the submitted password with the encrypted one saved in the database
    stored_password = BCrypt::Password.new(user.password)
    if stored_password == submitted_password
      return 'login success'
    else
      return 'wrong password'
    end
  end

  # do a sign out too
end
