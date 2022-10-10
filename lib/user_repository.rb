require_relative './user'
require_relative './database_connection'

class UserRepository
  def all
    # Executes the SQL query:
    sql = 'SELECT id, name, username, email, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.username = record['username']
      user.email = record['email']
      user.password = record['password']
      
      users << user
    end
    return users
  end
  def find(id)
    sql = 'SELECT id, name, username, email, password FROM users WHERE id = $1'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    record = result_set[0]

    user = User.new
    user.id = record['id']
    user.name = record['name']
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']

    return user
  end
  def find_by_username(username)
    sql = 'SELECT id, name, username, email, password FROM users WHERE username = $1'
    sql_params = [username]
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    record = result_set[0]

    user = User.new
    user.id = record['id']
    user.name = record['name']
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']

    return user
  end
  def create(user)
    sql = 'INSERT INTO 
            users (name, username, email, password) 
            VALUES($1, $2, $3, $4);'
    sql_params = [user.name, user.username, user.email, user.password]
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end
end