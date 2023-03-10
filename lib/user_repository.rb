class UserRepository
  def add_user(user)
    # Encrypts password
    # Executes sql: (where password is encrypted)
    # INSERT INTO users (name, username, password, email) VALUES ($1, $2, $3, $4);
    
    # Returns nothing
  end

  def authenticate(username, password)
    # Executes sql: 
    # SELECT password FROM users WHERE username = $1;
    # checks encrypted password against inputted password when user attempts to log in
    # returns boolean
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end

  def delete(user)
    # Executes the SQL query:
    # DELETE FROM users WHERE id = $1 

    # returns nothing
  end
end