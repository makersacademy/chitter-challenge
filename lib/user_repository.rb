require_relative 'user'

class UserRepository
  def all
    users = []

    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      user = User.new
        user.id = record['id'].to_i
        user.name = record['name']
        user.username = record['username']
        user.email = record['email_address']
        user.password = record['password']
        users << user
    end
    return users
  end

  def find(id)
    sql = 'SELECT * FROM users WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])
    user = User.new
    user.id = result[0]['id'].to_i
    user.name = result[0]['name']
    user.username = result[0]['username']
    user.email = result[0]['email']
    user
  end

  def create(user)
    sql = 'INSERT INTO users(name, username, email, password) VALUES($1, $2, $3, $4);'
    params = [user.name, user.username, user.email, user.password]
    result = DatabaseConnection.exec_params(sql, params)
  end
end