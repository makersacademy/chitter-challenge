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

  def find(id)
    sql = 'SELECT * FROM users WHERE id = $1;'
    
    result_set = DatabaseConnection.exec_params(sql,[id])
    
    record = result_set[0]

      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.password = record['password']
      user.username = record['username']
      user.email = record['email']

      return user
    end
  
end