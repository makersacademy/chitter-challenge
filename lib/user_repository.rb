require_relative 'users'

class UserRepository
  def all 
    users = []
    sql = 'SELECT * from users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |info|
      user = User.new
      user.id = info['id'].to_i
      user.username = info['username']
      user.password = info['password']

      users << user
    end
    return users
  end
end

def find(id)
  sql - 'SELECT * FROM users'