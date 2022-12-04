require_relative 'user'

class UserRepository
  
  def all # this method will use an SQL query to return all the users so that we can print them on the site
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []
    
    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.email = record['email']
      user.password = record['password']
      user.name = record['name']
      user.username = record['username']
      users << user
    end
    users
  end

  def create(user) # this method will allow us to create a new user and add to the users
    sql = 'INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3, $4);'
    params = [user.email, user.password, user.name, user.username]
    DatabaseConnection.exec_params(sql, params)
  end

end