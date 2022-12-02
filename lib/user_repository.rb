require_relative 'user'

class UserRepository

  # Gets all users
  # No arguments
  def all
    # Executes the SQL query:
    sql = "SELECT id, email_address, password, name, username FROM users;"
    params = []

    result_set = DatabaseConnection.exec_params(sql, params)

    users = []

    result_set.each do |record|
      user = User.new
      user.id = record["id"]
      user.email_address = record["email_address"]
      user.password = record["password"]
      user.name = record["name"]
      user.username = record["username"]

      users << user
    end

    return users
  end

  # creates a new user (account)
  # takes one argument: a User object
  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (email_address, password, name, username) VALUES ($1, $2, $3, $4);

    # Returns nil
  end
end