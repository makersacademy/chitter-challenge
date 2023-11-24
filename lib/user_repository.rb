require_relative 'user'
require_relative 'database_connection'


class UserRepository

  def all
    # Executes the SQL query:
    sql = 'SELECT id, name, email, username, password FROM users;'
    sql_params = []

    users = []
    result_set = DatabaseConnection.exec_params(sql,sql_params)

    result_set.each {|record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.email = record['email']
      user.username = record['username']
      user.password = record['password']
      users << user
    }

    # Returns an array of User objects.
    return users
  end

  def find_by_username(username)
    # Executes the SQL query:
    sql = 'SELECT id, name, email, username, password FROM users WHERE username = $1;'
    sql_params = [username]

    record = DatabaseConnection.exec_params(sql,sql_params)[0]

    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.email = record['email']
    user.username = record['username']
    user.password = record['password']


    # Returns a User object.
    return user
  end

  def find(user_id)
    # Executes the SQL query:
    sql = 'SELECT id, name, email, username, password FROM users WHERE id = $1;'
    sql_params = [user_id]

    record = DatabaseConnection.exec_params(sql,sql_params)[0]

    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.email = record['email']
    user.username = record['username']
    user.password = record['password']


    # Returns a User object.
    return user
  end

  def create(user)
    # Executes the SQL query:
    sql = 'INSERT INTO users (name, email, username, password) VALUES ($1, $2, $3, $4);'
    sql_params = [user.name, user.email, user.username, user.password]

    DatabaseConnection.exec_params(sql,sql_params)

    return nil
  end

  def get_tagged_users(peep_id)
    # Executes the SQL query:
    sql = 'SELECT users.id, users.name, users.email, users.username, users.password FROM users JOIN peeps_users ON users.id = peeps_users.user_id JOIN peeps ON peeps.id = peeps_users.peep_id WHERE peeps.id = $1;'
    sql_params = [peep_id]

    users = []
    result_set = DatabaseConnection.exec_params(sql,sql_params)

    result_set.each {|record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.email = record['email']
      user.username = record['username']
      user.password = record['password']

      users << user
    }

    # Returns an array of User objects.
    return users
  end
end