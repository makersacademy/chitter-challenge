require_relative 'user'

class UserRepository
  def all
    users = []

    query = 'select * from users'
    result_set = DatabaseConnection.exec_params(query, [])

    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.email = record['email']
      user.password = record['password']
      user.name = record['name']
      user.username = record['username']

      users << user
    end
    return users
  end

  def find(id)
    query = 'select * from users where id = $1'
    result_set = DatabaseConnection.exec_params(query, [id])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']

    return user
  end

  def create(user)
    query = 'INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(query, [user.email, user.password, user.name, user.username])

    return user
  end
end
