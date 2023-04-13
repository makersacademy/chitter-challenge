require_relative 'database_connection'
require_relative './user'

class UserRepository 
  def create(user)
    params = [user.name, user.username, user.email, user.password]
    sql = 'INSERT INTO users (name, username, email_address, password) VALUES ($1, $2, $3, $4)'
    DatabaseConnection.exec_params(sql, params)
    return true
  end

  def all
    output = []
    sql = 'SELECT * FROM users'
    result = DatabaseConnection.exec_params(sql, [])
    result.each do |user_item|
      user = User.new(user_item['name'],
                      user_item['username'],
                      user_item['email_address'],
                      user_item['password'])
      output << user
    end
    return output
  end

  def find_by_id(id)
    sql = 'SELECT * FROM users WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
    user = User.new(result.first['id'],
                    result.first['name'],
                    result.first['username'],
                    result.first['email_address'],
                    result.first['password'])
    return user
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email_address = $1;'
    params = [email]
    result = DatabaseConnection.exec_params(sql, params)
    user = User.new(result.first['id'], 
                    result.first['name'],
                    result.first['username'],
                    result.first['email_address'],
                    result.first['password'])
    return user
  end

  def find_by_username(username)
    sql = 'SELECT * FROM users WHERE username = $1;'
    params = [username]
    result = DatabaseConnection.exec_params(sql, params)
    user = User.new(result.first['id'], 
                    result.first['name'],
                    result.first['username'],
                    result.first['email_address'],
                    result.first['password'])
    return user
  end

  def find_by_name(name)
    sql = 'SELECT * FROM users WHERE name = $1;'
    params = [name]
    result = DatabaseConnection.exec_params(sql, params)
    user = User.new(result.first['id'], 
                    result.first['name'],
                    result.first['username'],
                    result.first['email_address'],
                    result.first['password'])
    return user
  end
end
