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
      user.name = row['name']
      user.username = row['username']
      user.email = row['email']
      user.password = row['password']

      users << user
    end

    return users
  end

  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)

    sql = 'INSERT INTO users (id, name, username, email, password) VALUES ($1, $2, $3, $4, $5);'
    params = [user.id, user.name, user.username, user.email, encrypted_password]

    DatabaseConnection.exec_params(sql, params)
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.name = result_set[0]['name']
    user.email = result_set[0]['email']
    user.username = result_set[0]['username']
    user.password = result_set[0]['password']

    return user
  end

  def log_in(email, password_attempt)
    user = find_by_email(email)

    return nil if user.nil?

    encrypted_password_attempt = BCrypt::Password.create(password_attempt)

    if user.password == encrypted_password_attempt
      p true
    else
      p false
    end
  end
end