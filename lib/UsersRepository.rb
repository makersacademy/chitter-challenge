require_relative "user"
require 'active_support'

class UsersRepository 

  
  def all
    sql = "SELECT * FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []
    result_set.each do |object|
        user = User.new
        user.id = object["id"]
        user.username = object["username"]
        user.email = object["email"]
        user.password = object["password"]
        users << user
    end
    return users
  end

  def find(id)
    sql = "SELECT * FROM users WHERE id = $1;"
    result_set = DatabaseConnection.exec_params(sql, [id])
    users = []
    result_set.each do |object|
        user = User.new
        user.id = object["id"]
        user.username = object["username"]
        user.email = object["email"]
        user.password = object["password"]
        users << user
    end
    return users.first
  end

  def create(user)
    sql = "INSERT INTO users(username, email, password) VALUES($1, $2, $3);"
    encrypted_password = Base64.encode64(user.password)
    params = [user.username, user.email, encrypted_password]
    DatabaseConnection.exec_params(sql, params)
  end

  def update(user)
    sql = "UPDATE users SET username = $1, email = $2, password = $3 WHERE id = $4;"
    params = [user.username, user.email, user.password, user.id]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(user)
    sql = "DELETE FROM users WHERE id = $1;"
    DatabaseConnection.exec_params(sql, [user.id])
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?
    encrypted_submitted_password = Base64.encode64(submitted_password)
    # if user.password[-2] == "\\"
    #   user.
    remove_backslash = encrypted_submitted_password.length - 1
    if user.password.chars[0,remove_backslash].join == encrypted_submitted_password.chars[0,remove_backslash].join
      true 
    else
      false 
    end
  end

  def find_by_email(email)
    sql = "SELECT * FROM users WHERE email = $1"
    result_set = DatabaseConnection.exec_params(sql, [email])
    user = User.new
    result_set.each do |object|
      user.id = object['id']
      user.username = object['username']
      user.email = object['email']
      user.password = object['password']
    end
    if user.username == nil
      return false
    else
      return user 
    end 
  end
end