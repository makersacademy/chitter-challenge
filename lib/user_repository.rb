require_relative 'user'

class UserRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    sql = 'SELECT id, name, email, username, password FROM users;'

    result_set = DatabaseConnection.exec_params(sql, [])

    users = []

    result_set.each do |record|
      user = User.new 
      user.id = record['id']
      user.name = record['name']
      user.email = record['email']
      user.username = record['username']
      user.password = record['password']

      users << user
    end 
    # Returns an array of user objects.
    return users

  end

  def find(id)
    # executes the SQL query: 
    sql = 'SELECT id, name, email, username, password FROM users WHERE id = $1;' 
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    user = User.new
    user.id = result_set[0]['id']
    user.name = result_set[0]['name']
    user.email = result_set[0]['email']
    user.username = result_set[0]['username']
    user.password = result_set[0]['password']

    return user


    #returns a single user 
  end 

  def create(user)
    # executes the SQL query: 
    sql = 'INSERT INTO users (name, email, username, password) VALUES($1, $2, $3, $4);'
    sql_params = [user.name, user.email, user.username, user.password]

    DatabaseConnection.exec_params(sql, sql_params)

    # returns nothing 
  end
end