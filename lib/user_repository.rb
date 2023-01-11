require_relative 'user'
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT * FROM users'
    results = DatabaseConnection.exec_params(sql, [])
    users = []
    results.each do |record|
      users << process_details(record)
    end
    users
  end

  def signup(user)
    sql = "INSERT INTO users (username, email, password) VALUES ($1, $2, $3);"
    params = [user.username, user.email, BCrypt::Password.create(user.password)]
    DatabaseConnection.exec_params(sql, params)
  end

  def signin(email, password)
    user = select_by_email(email)
    BCrypt::Password.new(user.password) == password ? user : false
  end

  private

  def process_details(record)
    user = User.new
    user.id = record['id'].to_i
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']
    user
  end

  def select_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1'
    params = [email]
    result_set = DatabaseConnection.exec_params(sql, params)
    process_details(result_set[0])
  end
  

end
