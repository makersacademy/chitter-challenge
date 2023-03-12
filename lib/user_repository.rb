require 'digest'
require_relative 'database_connection'
require_relative 'user'

class UserRepository
  def add_user(user)
    encrypted_password = Digest::SHA256.hexdigest(user.password)[0..20]
    # Encrypts password
    # Executes sql: (where password is encrypted)
    user_exist = find_by_email(user.email).nil?
    
    if user_exist
      sql = 'INSERT INTO users (name, username, password, email) VALUES ($1, $2, $3, $4);'
      params = [user.name, user.username, encrypted_password, user.email]
      DatabaseConnection.exec_params(sql, params)
    else
      return false
    end
  end

  def find_by_email(email)
    sql = 'SELECT id, name, username, password, email FROM users WHERE email = $1'
    result = DatabaseConnection.exec_params(sql, [email])
    return nil if result.ntuples == 0
    user = User.new
    user.id = result[0]['id'].to_i
    user.name = result[0]['name']
    user.username = result[0]['username']
    user.password = result[0]['password']
    user.email = result[0]['email']
    
    return user
  end

  # checks encrypted password against inputted password when user attempts to log in
  def sign_in(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?

    submitted_password_encrypted = Digest::SHA256.hexdigest(submitted_password)[0..20]
    # Executes sql: 
    sql = 'SELECT id, name, username, password FROM users WHERE username = $1;'
    result = DatabaseConnection.exec_params(sql, [user.username])
    
    if submitted_password_encrypted == result[0]['password']
      return true
    else
      return false
    end
  end

  def all
    users = []
    sql = 'SELECT id, name, username, password, email FROM users'
    result = DatabaseConnection.exec_params(sql, [])

    result.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.username = record['username']
      user.password = record['password']
      user.email = record['email']
      users << user
    end
    # return array of users
    users
  end
  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, name, username, password, email FROM users WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])

    user = User.new
    user.id = result[0]['id'].to_i
    user.name = result[0]['name']
    user.username = result[0]['username']
    user.password = result[0]['password']
    user.email = result[0]['email']

    # Returns a single peep object.
    user
  end

  def delete(id)
    # Executes the SQL query:
    sql = 'DELETE FROM users WHERE id = $1 '
    DatabaseConnection.exec_params(sql, [id])
  end
end