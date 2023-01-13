require_relative 'user'
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT * FROM users'
    results = DatabaseConnection.exec_params(sql, [])
    users = []
    results.each do |record|
      users << process_user_details(record)
    end
    users
  end

  def signup(user)
    sql = "INSERT INTO users (username, email, password) VALUES ($1, $2, $3);"
    params = [user.username, user.email, BCrypt::Password.create(user.password)]
    DatabaseConnection.exec_params(sql, params)
  end

  def check_valid_user(username, password)
    user = find_by_username(username)
    BCrypt::Password.new(user.password) == password ? user : false
  end

  def find_by_username(username)
    sql = 'SELECT * FROM users WHERE username = $1'
    params = [username]
    result_set = DatabaseConnection.exec_params(sql, params)
    process_user_details(result_set[0])
  end

  def find_by_id(id)
    sql = 'SELECT * FROM users WHERE username = $1'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    process_user_details(result_set[0])
  end

  def usernames
    usernames = []
    sql = 'SELECT username FROM users'
    results = DatabaseConnection.exec_params(sql, [])
    results.each { |record| usernames << record }
    usernames
  end
  
  private

  def process_user_details(record)
    user = User.new
    user.id = record['id'].to_i
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']
    user
  end

end
