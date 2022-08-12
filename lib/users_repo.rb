require_relative 'users'

class UserRepository
  
  def all
    users = []

    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.map do |user|
      new_user = Users.new
      new_user.id = user['id'].to_i
      new_user.name = user['name']
      new_user.username = user['username']
      new_user.email = user['email']
      new_user.password = user['password']

      users.push(new_user)
    end

    return users
  end

end