class UserRepository

  def all
    SELECT id, name, username, email, password FROM users;

    # Returns an array of User objects.
  end

  # Creates a new user
  def create(user)
    # Executes the SQL query:
    # INSERT INTO users(id, name, username, email, password) VALUES ($1, $2, $3, $4);

    # creates a new User object.
  end
end