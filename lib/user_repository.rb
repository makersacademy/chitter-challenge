require_relative 'user'

class UserRepository

  def all
    sql = 'SELECT id, email, name, username FROM users;'
    result_set = DatabaseConnection.exec_params(sql,[])

    users = []

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.email = record['email']
      user.name = record['name']
      user.username = record['username']

      users << user
    end

    return users
  end

  def create(user)
    sql = 'INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3, $4) '
    sql_params = [user.email,user.password,user.name,user.username]

    DatabaseConnection.exec_params(sql,sql_params)
    return nil
    end

end