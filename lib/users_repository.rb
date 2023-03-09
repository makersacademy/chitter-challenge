require 'users'

class UsersRepository

  # Selecting all records
  # No arguments
  def all
    users = []
    sql = 'SELECT id, username, email_address, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      user = Users.new

      user.id = record['id']
      user.username = record['username']
      user.email_address = record['email_address']
      user.password = record['password']

      users << user
    end
        # Returns an array of User objects.
    return users
  end

  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, username, email_address, password FROM users WHERE id = $1;'
    params = [id]

    result = DatabaseConnection.exec_params(sql, params)

    record = result[0]

    user = Users.new
    user.id = record['id']
    user.username = record['username']
    user.email_address = record['email_address']
    user.password = record['password']
    
    return user

    # Returns a single user object.
  end

  def create(user)
    #executes the sql query
    sql = 'INSERT INTO users (username, email_address, password) VALUES ($1, $2, $3)'
    params = [user.username, user.email_address, user.password]
    DatabaseConnection.exec_params(sql, params)
    #returns nil
    end

  def update(user)
    #executes a sql query
    sql = 'UPDATE users SET username = $1, email_address = $2, password = $3 WHERE id = $4;'
    params = [user.username, user.email_address, user.password, user.id]
    DatabaseConnection.exec_params(sql, params)
  end


  def delete(id)
    #executes a sql query
  sql = 'DELETE FROM users WHERE id = $1;'
  params = [id]
  DatabaseConnection.exec_params(sql, params)
  #returns nothing just deletes the record. 
  end
end

