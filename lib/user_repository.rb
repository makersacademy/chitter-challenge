require_relative './database_connection'
require_relative './user'
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    all_users = []
    result_set.each do |record|
      user = User.new
      user.name = record['name']
      user.username = record['username']
      user.password = record['password']
      user.email = record['email']
      all_users << user
    end
    all_users
  end

  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)
    sql = 'INSERT INTO users (username, password, email, name) VALUES ($1, $2, $3, $4);'
    sql_params = user.username, encrypted_password, user.email, user.name
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def find_by_email(email)
    sql = 'SELECT id, username, password, name, email FROM users WHERE email = $1;'
    result = DatabaseConnection.exec_params(sql, [email])
    user = User.new
    user.name = result[0]['name']
    user.username = result[0]['username']
    user.email = result[0]['email']
    user.id = result[0]['id'].to_i
    user.password = result[0]['password']
    user
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?

    if BCrypt::Password.new(user.password) == submitted_password
      true
    else
      false
    end
  end
end


# a = submitted_password
# b = user.password
# c = BCrypt::Password.new("$2a$12$U5wMS5nMYmXy5yd2cWutnuOxy6G/idkFBZ2BFyGmZdVyeWoasCdcm")
# d = 'password123'