require_relative 'user'
class UserRepository
  def all
    sql = 'SELECT id, username, password, user_email FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []
    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.username = record['username']
      user.password = record['password']
      user.user_email = record['user_email']
      users << user
    end
    return users
  end

  def create(new_user)
    sql = 'INSERT INTO users (username, password, user_email) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, 
[new_user.username, new_user.password, new_user.user_email])
    return new_user
  end

  def find(id)
    sql = 'SELECT id, username, password, user_email FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    user = User.new
    user.id = result_set[0]['id'].to_i
    user.username = result_set[0]['username']
    user.password = result_set[0]['password']
    user.user_email = result_set[0]['user_email']
    return user
  end
end
