require_relative 'user'

class UserRepository

  def all
    users = []
    sql = 'SELECT id, name, username, email, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.username = record['username']
      user.email = record['email']
      user.password = record['password']

      users << user
    end
    
    return users
  end


  def create(user)
    sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [user.name, user.username, user.email, user.password])
  end

end