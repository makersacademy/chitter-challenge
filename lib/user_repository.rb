require_relative 'user'
require 'bcrypt'

class UserRepository

  # Gets all user info
  def all
    sql = "SELECT id, email_address, password, name, username FROM users;"
    params = []
    result_set = DatabaseConnection.exec_params(sql, params)
    users = []
    result_set.each do |record|
      users << record_into_user(record)
    end
    return users
  end

  # Creates a new user
  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)
    sql = "INSERT INTO users (email_address, password, name, username) VALUES ($1, $2, $3, $4);"
    params = [user.email_address, encrypted_password, user.name, user.username]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  # Finds the User object that created the peep
  def find_user_by_id(user_id)    
    sql = "SELECT id, email_address, password, name, username FROM users WHERE id = $1"
    params = [user_id]
    result_set = DatabaseConnection.exec_params(sql, params)
    record = result_set[0]
    user = record_into_user(record)
    return user
  end

  # Finds the User object that has the given email address
  def find_user_by_email(email_address)
    # Return nil if no user exists with given email address
    repo = UserRepository.new
    users = repo.all
    invalid_email = true
    users.each do |existing_user|
      invalid_email = false if email_address == existing_user.email_address
    end
    return nil if invalid_email == true
    
    # Gets info of user that posted a peep
    sql = "SELECT id, email_address, password, name, username FROM users WHERE email_address = $1"
    params = [email_address]
    result_set = DatabaseConnection.exec_params(sql, params)
    record = result_set[0]
    user = record_into_user(record)
    return user
  end

  # Converts a record from the database connection result set into a User object
  def record_into_user(record)
    user = User.new
    user.id = record["id"]
    user.email_address = record["email_address"]
    user.password = record["password"]
    user.name = record["name"]
    user.username = record["username"]
    return user
  end
end