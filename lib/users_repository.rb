require_relative 'users'
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result = DatabaseConnection.exec_params(sql, [])

    result.map do |user|
      new_user = User.new(
        id: user['id'].to_i,
        username: user['username'],
        name: user['name'],
        password_hash: user['password_hash'],
        email: user['email']
      )
    end
  end

  def create(username:, name:, password_hash:, email:)
    sql = 'INSERT INTO users (username, name, password_hash, email) VALUES ($1, $2, $3, $4) RETURNING *;'
    result = DatabaseConnection.exec_params(sql, [username, name, password_hash, email])
  
    User.new(
      id: result[0]['id'].to_i,
      username: result[0]['username'],
      name: result[0]['name'],
      password_hash: result[0]['password_hash'],
      email: result[0]['email']
    )
  end  

  def find_user_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1;'
    result = DatabaseConnection.exec_params(sql, [email])
  
    return nil if result.ntuples.zero?
  
    User.new(
      id: result[0]['id'].to_i,
      username: result[0]['username'],
      name: result[0]['name'],
      password_hash: result[0]['password_hash'],
      email: result[0]['email']
    )
  end  
end
