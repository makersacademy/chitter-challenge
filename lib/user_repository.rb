require_relative "./user"
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT * FROM users'
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
    return nil if !result
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
    return { success: false, reason: "invalid username "} if !user
    stored_password = BCrypt::Password.new(user.password)
    if stored_password == submitted_password
       return { success: true, username: user.username, user_id: user.id }
    else
      return { success: false, reason: "incorrect password "}
    end
  end

  def create(user)
    sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'
    hashed_password = BCrypt::Password.create(user.password)
    params = [user.name, user.username, user.email, hashed_password]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end
end