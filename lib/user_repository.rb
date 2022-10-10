require_relative 'user'

class UserRepository
  def all
    sql = 'SELECT id, email, name, username, password from users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []
    result_set.each do |info|
      user = User.new
      user.id = info['id'].to_i
      user.email = info['email']
      user.name = info['name']
      user.username = info['username']
      user.password = info['password']
      users << user
    end
    return users
  end

  def find(id)
    sql = 'SELECT * FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    user = User.new
    user.id = result_set[0]['id'].to_i
    user.email = result_set[0]['email']
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']
    user.password = result_set[0]['password']
    return user 
  end 

  def create(user)
    sql = 'INSERT INTO users (username, password) VALUES ($1, $2);'
    result_set = DatabaseConnection.exec_params(sql, [user.email, user.name, user.username, user.password])
    return user
  end
end

repo = UserRepository.new
print repo.all
