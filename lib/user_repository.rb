require_relative 'user'

class UserRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, email, username, and password FROM users;

    # Returns an array of user objects.
  end

  def find(id)
    # executes the SQL query: 
    # SELECT id, name, email, username, and password FROM users WHEN id = $1; 

    #returns a single user 
  end 

  def create(user)
    # executes the SQL query: 
    # INSERT INTO users (name, email, username, password) VALUES($1, $2, $3, $4);

    # returns nothing 
  end
end