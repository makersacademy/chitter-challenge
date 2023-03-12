require 'user_repository'
require 'user'

class UserRepository

  # Returning all user records
  # No arguments
  def all
    @users = []

    sql = "SELECT id, name, username, email, password FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |item|
      user = User.new
      user.id = item['id'].to_i
      user.name = item['name']
      user.username = item['username']
      user.email = item['email']
      user.password = item['password']

      @users << user
    end

    return @users
  end

  # Creating a new user record
  # Takes one argument (an object of the User class)
  def create(user)

    if username_check(user.username)
      return 'The username is already registered!'
    elsif email_check(user.email)
      return 'The email is already registered!'
    else
      sql = "INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);"
      DatabaseConnection.exec_params(sql, [user.name, user.username, user.email, user.password])
    end
    return ''
  end

  # Method to check whether username has already been registered.
  # Returns true if it does, false if not.
  def username_check(username_to_verify)
    sql = 'SELECT * FROM users WHERE username = $1;'
    existing_user = DatabaseConnection.exec_params(sql, [username_to_verify]).first

    if existing_user
      user = User.new
      user.id = existing_user['id'].to_i
      user.name = existing_user['name']
      user.username = existing_user['username']
      user.email = existing_user['email']
      user.password = existing_user['password']
  
      if username_to_verify == user.username
        return true
      end
    end
  
    return false
  end

  # Method to check whether email has already been registered.
  # Returns true if it does, false if not.
  def email_check(email_to_verify)
    sql = 'SELECT * FROM users WHERE email = $1;'
    existing_user = DatabaseConnection.exec_params(sql, [email_to_verify]).first

    if existing_user
      user = User.new
      user.id = existing_user['id'].to_i
      user.name = existing_user['name']
      user.username = existing_user['username']
      user.email = existing_user['email']
      user.password = existing_user['password']
  
      if email_to_verify == user.email
        return true
      end
    end
  
    return false
  end
end