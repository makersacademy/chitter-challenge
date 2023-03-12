require_relative 'user'

class UserRepository
  def all_users
    users = []

    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.email = record['email']
      user.password = record['password']
      user.name = record['name']
      user.username = record['username']

      users << user
    end

    return users
  end
end