require_relative './user'
require_relative './database_connection'

class UserRepository
  def initialize
    DatabaseConnection.connect('chitter_directory_test')
  end 

  def all
    sql = 'SELECT id, name, username, email, password 
           FROM users 
           ORDER by id;'
    result_set = DatabaseConnection.exec_params(sql, [])

    return get_users(result_set)
  end

  def find(id)
    sql = 'SELECT * FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    return get_users(result_set)[0]
  end
  
  def find_username(username)
    sql = 'SELECT * FROM users WHERE username = $1;'
    result_set = DatabaseConnection.exec_params(sql, [username])

    return get_users(result_set)[0]
  end

  def find_email(email)
    sql = 'SELECT * FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])

    return get_users(result_set)[0]
  end

  def create(user)
    sql = 'INSERT INTO users 
          (name, username, email, password) 
          VALUES ($1, $2, $3, $4);'
    params = [
      user.name,
      user.username,
      user.email,
      user.password
    ]
    DatabaseConnection.exec_params(sql, params)
  end

  def update(id, col, val)  
    sql = 'UPDATE users SET name = $2 WHERE id = $1;' if col == 'name' 
    sql = 'UPDATE users SET username = $2 WHERE id = $1;' if col == 'username'
    sql = 'UPDATE users SET email = $2 WHERE id = $1;' if col == 'email'
    sql = 'UPDATE users SET password = $2 WHERE id = $1;' if col == 'password'

    params = [id, val]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end

  private

  def get_users(result_set)
    users = []
    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.username = record['username']
      user.email = record['email']
      user.password = record['password']
      users << user
    end
    return users
  end
end
