require_relative 'user'
require 'bcrypt'

class UserRepository
  def all
    users = []

    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])    

    result_set.each do |record|

      user = User.new
      user.id = record['id'].to_i
      user.email = record['email']
      user.password = record['password']
      user.f_name = record['f_name']
      user.handle = record['handle']

      users << user
    end

    return users
  end
  
  def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
    user.f_name = result_set[0]['f_name']
    user.handle = result_set[0]['handle']

    return user
  end

  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)

    sql = 'INSERT INTO users (email, password, f_name, handle) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [user.email, encrypted_password, user.f_name, user.handle])
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?

    hash_check = BCrypt::Password.new(user.password)

    if hash_check == submitted_password      
      return "successful"
    else
      return "failure"
    end
  end
end