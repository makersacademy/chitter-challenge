require_relative 'user'
require_relative 'database_connection'


class UserRepository

  def find(username)
    # Executes the SQL query:
    # SELECT id, name, email, username FROM users WHERE username = $1;
    sql = 'SELECT id, name, email, username FROM users WHERE username = $1;'
    sql_params = [username]

    record = DatabaseConnection.exec_params(sql,sql_params)[0]

    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.email = record['email']
    user.username = record['username']

    # Returns a User object.
    return user
  end

  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (name, email, username) VALUES ($1, $2, $3);
    sql = 'INSERT INTO users (name, email, username) VALUES ($1, $2, $3);'
    sql_params = [user.name, user.email, user.username]

    DatabaseConnection.exec_params(sql,sql_params)

    # returns nil
    return nil
  end
end