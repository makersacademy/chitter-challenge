require_relative 'user'

class UserRepository
  def all
    sql = 'SELECT * FROM users'
    results = DatabaseConnection.exec_params(sql, [])
    users = []
    results.each do |result|
      user = User.new
      user.id = result['id'].to_i
      user.username = result['username']
      user.email = result['email']
      user.password = result['password']
      users << user
    end
    users
  end

  def add(user)
  end
end
