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
      user = User.new
      user.email = record['email']
      user.password = record['password']
      user.name = record['name']
      user.username = record['username']
      users << user
    end
    # Returns an array of User objects.
    return users
  end

  # Selects a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, email, password, name, username FROM users WHERE id = $1

    # Returns a single User object.
  end

  # Creates a new record
  # One argument: a new User Object
  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3, $4)

    # Does not return a value
  end

  # Deletes a record
  # One argument: the id (number)
  def delete(id)
    # Executes the SQL query:
    # DELETE FROM users WHERE id = $1
    
    # Does not return a value
  end

end