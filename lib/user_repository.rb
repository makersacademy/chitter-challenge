require_relative './database_connection'
require_relative './user'
class UserRepository
  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql,[])

    users = []
    result_set.each do |result|
      user = format_single_user(result)
      users << user
    end
    return users
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    sql = 'SELECT * FROM users WHERE id = $1;'
    params = [id]

    result = DatabaseConnection.exec_params(sql,params)
    user = format_single_user(result[0])
    return user
  end

  def find_by_username(username)
    # Executes the SQL query:
    sql = 'SELECT * FROM users WHERE username = $1;'
    params = [username]

    result = DatabaseConnection.exec_params(sql,params)
    user = format_single_user(result[0])
    return user
  end

  def find_by_name(name)
    sql = 'SELECT * FROM users WHERE name = $1;'
    params = [name]
    
    result = DatabaseConnection.exec_params(sql,params)
    user = format_single_user(result[0])
    return user
  end
  # Add more methods below for each operation you'd like to implement.

  def create(user)
    # Executes the SQL query:
    sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'
    params = [user.name, user.username, user.email, user.password]

    DatabaseConnection.exec_params(sql,params)
    return nil
  end

  private

  def format_single_user(result)
    user = User.new
    user.id = result["id"].to_i
    user.name = result["name"]
    user.username = result["username"]
    user.email = result["email"]
    user.password = result["password"]
    return user
  end
end
