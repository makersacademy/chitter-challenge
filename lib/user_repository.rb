require_relative 'user'

class UserRepository

  # Selecting all records
  # No arguments
  def all
    users = []
    # Executes the SQL query:
    sql = 'SELECT id, email, password, name, username FROM users;'

    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      users << record_into_user_object(record)
    end
    # Returns an array of User objects.
    return users
  end

  # Selects a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, email, password, name, username FROM users WHERE id = $1'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    record = result_set[0]
    # Returns a single User object.
    return record_into_user_object(record)
  end

  # Creates a new record
  # One argument: a new User Object
  def create(user)
    # Executes the SQL query:
    sql = 'INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3, $4)'
    sql_params = [user.email, user.password, user.name, user.username]

    DatabaseConnection.exec_params(sql, sql_params)
    # Does not return a value
  end

  # Deletes a record
  # One argument: the id (number)
  def delete(id)
    # Executes the SQL query:
    sql = 'DELETE FROM users WHERE id = $1'
    sql_params = [id]
    
    DatabaseConnection.exec_params(sql, sql_params)
    # Does not return a value
  end

  private

  def record_into_user_object(record)
    user = User.new
    user.id = record['id'].to_i
    user.email = record['email']
    user.password = record['password']
    user.name = record['name']
    user.username = record['username']
    return user
  end

end
