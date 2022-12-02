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

  # Creates a new user (account)
  # Takes one argument: a User object
  def create(user)
    raise "Please fill in all fields" if user.email_address == "" || user.password == "" || user.name == "" || user.username == ""
    
    repo = UserRepository.new
    users = repo.all
    users.each do |existing_user|
      raise "That email address is already taken" if user.email_address == existing_user.email_address
      raise "That username is already taken" if user.username == existing_user.username
    end

    # Executes the SQL query:
    sql = "INSERT INTO users (email_address, password, name, username) VALUES ($1, $2, $3, $4);"
    params = [user.email_address, user.password, user.name, user.username]

    DatabaseConnection.exec_params(sql, params)

    return nil
  end
end