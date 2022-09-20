require_relative 'user'
require 'bcrypt'

class UserRepository
  def all
    users = []

    sql = 'SELECT * FROM users;'
    result = DatabaseConnection.exec_params(sql, [])    

    result.each do |record|
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
    result = DatabaseConnection.exec_params(sql, [email])

    user = User.new
    user.id = result.first['id'].to_i
    user.email = result.first['email']
    user.password = result.first['password']
    user.f_name = result.first['f_name']
    user.handle = result.first['handle']

    return user
  end

  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)

    sql = 'INSERT INTO users (email, password, f_name, handle) VALUES ($1, $2, $3, $4);'
    result = DatabaseConnection.exec_params(sql, [user.email, encrypted_password, user.f_name, user.handle])
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
