require_relative './user'

class UserRepository
  def all
    sql = "SELECT * FROM users"
    records = DatabaseConnection.exec_params(sql, [])
    users = []

    records.each do |record|
      user = User.new
      user.id = record['id']
      user.username = record['username']
      user.password = record['password']
      users << user
    end

    return users
  end


  def create(user)
    sql = "INSERT INTO users (username, password) VALUES ($1, $2)"
    sql_params = [user.username, user.password]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1'
    sql_params = [id]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def find_by_id(id)
    sql = 'SELECT * FROM users WHERE id = $1'
    sql_params = [id]
    results = DatabaseConnection.exec_params(sql, sql_params)
    result = results[0]
    user = User.new
    user.id = result['id']
    user.username = result['username']
    user.password = result['password']
    return user
  end
end