require_relative 'user'

class UserRepository
  def all
    users = []

    sql = 'SELECT id, name, username, password, email FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.username = record['username']
      user.password = record['password']
      user.email = record['email']

      users << user
    end

    return users
  end

  def find(id)
    sql = 'SELECT id, name, username, password, email FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
      user = User.new
      user.id = result_set[0]['id'].to_i
      user.name = result_set[0]['name']
      user.username = result_set[0]['username']
      user.password = result_set[0]['password']
      user.email = result_set[0]['email']
    return user
  end

  def create(user)
    sql = 'INSERT INTO users (name, username, password, email) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [user.name, user.username, user.password, user.email])
    return user
  end

  def find_by_email(email)
    query = 'select * from users where email = $1;'
    result_set = DatabaseConnection.exec_params(query, [email])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']

    return user
  end
  
  def new
    @user = User.new
  end
end
