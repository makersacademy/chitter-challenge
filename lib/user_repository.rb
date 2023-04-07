require_relative './user'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    results = DatabaseConnection.exec_params(sql, [])
    users = []
    results.each{ |record| users << each_user(record) }
    return users
  end

  private

  def each_user(record)
    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']
    return user
  end
  
end