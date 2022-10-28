require_relative 'user'
require_relative 'database_connection'

class UserRepository
  def inflate(results)
    users = []
    results.each do |result|
      user = User.new
      user.id = result['id']
      user.email = result['email']
      user.password = result['password']
      user.name = result['name']
      user.username = result['username']
      if result['logged_in'] == "t"
        user.logged_in = true
      else
        user.logged_in = false
      end
      users << user
    end
    return users

  end
  
  def all
    # Executes the SQL query:
    sql = 'SELECT * FROM users;'
    results = DatabaseConnection.exec_params(sql, [])

    users = inflate(results)
  
    # Returns an array of User objects.
    return users
  end
  
  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    user = User.new
    # Executes the SQL query:
    sql = 'SELECT id, name, username, logged_in FROM users WHERE id = $1;'
    results = DatabaseConnection.exec_params(sql, [id])
    users = inflate(results)
    user = users[0]
    # Returns a single User object.
    return user
  end
  
  def create(user)
    # Executes the SQL query:
    sql = 'INSERT INTO users (email, password, name, username, logged_in)
    VALUES($1, $2, $3, $4, FALSE) RETURNING id;'
    params = [user.email, user.password, user.name, user.username]
    result = DatabaseConnection.exec_params(sql, params)
    return result
  end
  
  def log_in(user)
    # Executes the SQL query:
    sql = 'UPDATE users SET logged_in = TRUE WHERE (username = $1 AND password = $2);'
    result = DatabaseConnection.exec_params(sql, [user.username, user.password])
    return result.cmd_tuples
  end
  
  def log_out(id)
    # Executes the SQL query:
    sql = 'UPDATE users SET logged_in = FALSE WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end
end
