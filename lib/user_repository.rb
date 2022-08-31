class UserRepository
  # Selecting all records
  # No arguments
  def all
    sql = 'SELECT * FROM users;'
    

    # Executes the SQL query:
    # SELECT * FROM users;

    # Returns an array of user objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT * FROM users WHERE id = $1;

    # Returns a single user object.
  end

  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (username, name, email, password) VALUES ($1, $2, $3, $4);
  end

  # def update(user)
  # end

  # def delete(user)
  # end
end