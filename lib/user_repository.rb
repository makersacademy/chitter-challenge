require_relative 'user'
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []

    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.email_address = record['email_address']
      user.password = record['password']
      user.username = record['username']
      users << user
      end
    users
  end

  def sign_up(user)
    encrypted_password = BCrypt::Password.create(user.password)

    sql = 'INSERT INTO users (name, email_address, password, username)
    VALUES($1, $2, $3, $4);'

    result_set = DatabaseConnection.exec_params(sql, [user.name, user.email_address, encrypted_password, user.username])
  end

  def find_by_email(email_address)
    sql = 'SELECT * FROM users WHERE email_address = $1;'
    sql_params = [email_address]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    account = []

    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.username = record['username']
      user.email_address = record['email_address']
      user.password = record['password']
      account << user
    end
    account.empty? ? nil : account
  end

  def log_in(email_address, submitted_password)
    repository = UserRepository.new
    user = repository.find_by_email(email_address)
    return nil if user.nil?
    p email_address
    p submitted_password
    p user
    if BCrypt::Password.new(user[0].password) == submitted_password
      p "Sophie"
      p user[0]
      return user[0]
    else
      "Twm"
      return false
    end
  end
end