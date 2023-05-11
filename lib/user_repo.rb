require_relative 'user'
require_relative 'database_connection'

class UserRepo
  def initialize
    @users = []
  end

  def all
    sql = 'SELECT * 
          FROM user_accounts;'
    result = DatabaseConnection.exec_params(sql, [])
    result.each do |record|
      @users << new_user(record)
    end
    @users
  end

  def create(user)
    return true if check_unique(user.email_address, user.username)
    sql = 'INSERT INTO user_accounts (email_address, username, name, password) 
          VALUES ($1, $2, $3, $4);'
    params = [user.email_address, user.username, user.name, user.password]
    DatabaseConnection.exec_params(sql, params)
    return false
  end

  def check_unique(email_address, username)
    sql = 'SELECT email_address, username 
          FROM user_accounts 
          WHERE email_address = $1 OR username = $2;'
    params = [email_address, username]
    result = DatabaseConnection.exec_params(sql, params)
    return !result.first.nil?
  end

  def find_by_username(username)
    sql = 'SELECT * FROM user_accounts WHERE username = $1;'
    params = [username]
    result = DatabaseConnection.exec_params(sql, params)
    return new_user(result[0])
  end

  private

  def new_user(record)
    user = User.new
    user.id = record['id']
    user.email_address = record['email_address']
    user.username = record['username']
    user.name = record['name']
    user.password = record['password']
    user
  end
end
