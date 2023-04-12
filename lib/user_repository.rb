require_relative "./user"
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []
    
    result_set.each do |row|
      user = User.new
      user.name = row['name']
      user.username = row['username']
      user.email = row['email']
      user.password = row['password']
      users << user
    end

    return users
  end

  def find_by_username(username)
    sql = 'SELECT * FROM users WHERE username = $1;'
    result = DatabaseConnection.exec_params(sql, [username]).first

    return nil unless result

    user = User.new
    user.id = result['id'].to_i
    user.username = result['username']
    user.name = result['name']
    user.email = result['email']
    user.password = result['password']

    return user
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1;'
    result = DatabaseConnection.exec_params(sql, [email]).first

    return nil unless result

    user = User.new
    user.id = result['id'].to_i
    user.username = result['username']
    user.name = result['name']
    user.email = result['email']
    user.password = result['password']

    return user
  end

  def login(username, submitted_password)
    user = find_by_username(username)
    return { success?: false, failure_reason: "invalid username"} if !user
    stored_password = BCrypt::Password.new(user.password)

    if stored_password == submitted_password
       return { success?: true, username: user.username, user_id: user.id }
    else
      return { success?: false, failure_reason: "incorrect password"}
    end
  end

  def register(username, name, email, password)

    return {success?: false, failure_reason: "username is already taken"} if find_by_username(username)
    return {success?: false, failure_reason: "email is already taken"} if find_by_email(email)
  
    sql = 'INSERT INTO users (username, name, email, password) VALUES ($1, $2, $3, $4);'

    hashed_password = BCrypt::Password.create(password)
    params = [username, name, email, hashed_password]

    DatabaseConnection.exec_params(sql, params)

    return {success?: true}
  end
end