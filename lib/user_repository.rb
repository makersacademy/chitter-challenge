require_relative 'user'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []

    result_set.each do |row|
      user = User.new
      user.id = row['id']
      user.name = row['name']
      user.username = row['username']
      user.email = row['email']
      user.password = row['password']

      users << user
    end

    return users
  end

  def create(user)
    sql = 'INSERT INTO users (id, name, username, email, password) VALUES ($1, $2, $3, $4, $5);'
    params = [user.id, user.name, user.username, user.email, user.password]

    DatabaseConnection.exec_params(sql, params)
  end
end