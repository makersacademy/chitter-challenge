require_relative './user'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    results = DatabaseConnection.exec_params(sql, [])
    users = []
    results.each{ |record| users << user_builder(record) }
    return users
  end

  def create(user)
    sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'
    params = [user.name, user.username, user.email, user.password]
    DatabaseConnection.exec_params(sql, params)
  end

  private

  def user_builder(record)
    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']
    return user
  end
  
end