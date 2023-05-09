class UserRepository

  def find(username)
    # Executes the SQL query:
    # SELECT id, name, email, username FROM users WHERE username = $1;

    # Returns an array of User objects.
  end

  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (name, email, username) VALUES ($1, $2, $3);

    # returns nil
  end
end