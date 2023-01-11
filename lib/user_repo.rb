require_relative 'user'

class UserRepo
  def create(user)
    sql =
      "INSERT INTO users (name, username, email, password, logged_in) VALUES ('#{user.name}', '#{user.username}', '#{user.email}', '#{user.password}', false);"
    DatabaseConnection.exec_params(sql, [])
  end
  def all
    users = []
    sql = 'SELECT * FROM users;'
    results = DatabaseConnection.exec_params(sql, [])

    results.each do |record|
      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.username = record['username']
      user.email = record['email']
      user.password = record['password']
      user.logged_in = record['logged_in']
      users << user
    end
    users
  end
  def delete(id)
  end
  def login
  end
end
