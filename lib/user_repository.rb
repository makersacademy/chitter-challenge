require 'bcrypt'
require_relative 'user'

class UserRepository
  def initialize
    @users = []
  end
  
  def all_users
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.email = record['email']
      user.password = record['password']
      user.name = record['name']
      user.username = record['username']

      @users << user
    end

    return @users
  end

  # Hash is stored as string in database, not a BCrypt object
  def find_user(email_username, password)

    user = find_by_email_username(email_username)
    return nil if user.nil?

    # Converts stored has string back into a BCrypt object
    stored_password = BCrypt::Password.new(user.password)

    if stored_password == password
      return user
    else
      return false
    end
  end

  def find_by_email_username(email_username)
    sql = 'SELECT * FROM users WHERE (email = $1 OR username = $1);'
    record = DatabaseConnection.exec_params(sql, [email_username])
    p "record is #{record.inspect}"

    user = User.new
    user.id = record[0]['id']
    user.email = record[0]['email']
    user.password = record[0]['password']
    user.name = record[0]['name']
    user.username = record[0]['username']

    return user
  end

  def create_user(user)
    self.all_users

    @users.each do |record|
      if record.email == user.email || record.username == user.username
        return false
      end
    end

    user.password = BCrypt::Password.create(user.password)
    
    sql = 'INSERT INTO users (email, password, name, username) VALUES($1, $2, $3, $4)'
    params = [user.email, user.password, user.name, user.username]
    DatabaseConnection.exec_params(sql, params)

    return true
  end
end