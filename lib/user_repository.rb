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


  def find(id)
    sql - 'SELECT * FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.username = result_set[0]['username']
    user.password = result_set[0]['password']
    return artist 
  end 

  def create(user)
    sql = 'INSERT INTO users (username, password) VALUES ($1, $2);'
    result_set = DatabaseConnection.exec_params(sql, [user.username, user.password])
    return user
  end
end

