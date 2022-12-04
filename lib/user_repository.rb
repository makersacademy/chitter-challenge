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
      users << record_into_user(record)
    end

    return users
  end

  # Creates a new user (account)
  # Takes one argument: a User object
  def create(user)
    # # Raises error if any fields are empty
    # raise "Please fill in all fields" if user.email_address == "" || user.password == "" || user.name == "" || user.username == ""
    
    # # Raises error if email address or username is already taken
    # repo = UserRepository.new
    # users = repo.all
    # users.each do |existing_user|
    #   raise "That email address is already taken" if user.email_address == existing_user.email_address
    #   raise "That username is already taken" if user.username == existing_user.username
    # end

    # Creates user account
    # Executes the SQL query:
    sql = "INSERT INTO users (email_address, password, name, username) VALUES ($1, $2, $3, $4);"
    params = [user.email_address, user.password, user.name, user.username]

    DatabaseConnection.exec_params(sql, params)

    return nil
  end

  # finds the User object that created the peep
  # takes one argument: a Peep object
  def find_user_by_id(user_id)
    # # Raises error if there is no user with given id
    # repo = UserRepository.new
    # users = repo.all
    # invalid_user = true
    # users.each do |existing_user|
    #   invalid_user = false if user_id.to_s == existing_user.id
    # end
    # raise "No user exists at this address" if invalid_user == true

    
    # Gets info of user that posted a peep
    # Executes the SQL query:
    sql = "SELECT id, email_address, password, name, username FROM users WHERE id = $1"
    params = [user_id]

    result_set = DatabaseConnection.exec_params(sql, params)
    record = result_set[0]
    user = record_into_user(record)
    return user
  end

  def find_user_by_email(email_address)
    # Raises error if there is no user with given email_address
    repo = UserRepository.new
    users = repo.all
    invalid_email = true
    users.each do |existing_user|
      invalid_email = false if email_address == existing_user.email_address
    end
    return nil if invalid_email == true
    
    # Gets info of user that posted a peep
    # Executes the SQL query:
    sql = "SELECT id, email_address, password, name, username FROM users WHERE email_address = $1"
    params = [email_address]

    result_set = DatabaseConnection.exec_params(sql, params)
    record = result_set[0]
    user = record_into_user(record)

    return user
  end

  # converts a record from the database connection result set into a User object
  def record_into_user(record)
    user = User.new
    user.id = record["id"]
    user.email_address = record["email_address"]
    user.password = record["password"]
    user.name = record["name"]
    user.username = record["username"]
    return user
  end
end