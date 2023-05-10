require_relative 'user'

class UserRepository
  def all
    sql = 'SELECT id, name, email, username FROM users;'
    result = DatabaseConnection.exec_params(sql, [])
    user_array = []
    result.each do |row|
      user = User.new
      user.id = row['id']
      user.name = row['name']
      user.email = row['email']
      user.username = row['username']

      user_array << user
    end

    return user_array
  end

  def find(username)
    sql = 'SELECT id, name, email, username FROM users WHERE username = $1;'
    param = [username]
    result = DatabaseConnection.exec_params(sql, param)
    record = result.first
    user = User.new
    user.id = record['id']
    user.name = record['name']
    user.email = record['email']
    user.username = record['username']

    return user
  end
  
  def create(user)
    # Executes the SQL query:
    sql = 'INSERT INTO users (name, email, username) VALUES ($1, $2, $3);'
    params = [user.name, user.email, user.username]

    DatabaseConnection.exec_params(sql, params)
  
    return nil
  end
end
