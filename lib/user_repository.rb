require 'user'

class UserRepository

  # Returning all user records
  # No arguments
  def all
    users = []

    sql = "SELECT id, name, username, email, password FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |item|
      user = User.new
      user.id = item['id'].to_i
      user.name = item['name']
      user.username = item['username']
      user.email = item['email']
      user.password = item['password']

      users << user
    end

    return users
  end

  # Creating a new user record
  # Takes one argument
  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (id, name, username, email, password) VALUES ('id', 'name', 'username', 'email', 'password');
    # Returns nothing.
  end
end