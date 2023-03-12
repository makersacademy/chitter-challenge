require_relative 'user'

class UserRepository
  def initialize
    @users = []
  end
  
  def all_users
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.email = record['email']
      user.password = record['password']
      user.name = record['name']
      user.username = record['username']

      @users << user
    end

    return @users
  end

  def find_user(email_username, password)
    sql = 'SELECT * FROM users WHERE (email = $1 OR username = $1) AND password = $2;'
    params = [email_username, password]
    result_set = DatabaseConnection.exec_params(sql, params)

    user = User.new
    user.id = result_set[0]['id']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']

    return user
  end

  def create_user(user)
    self.all_users

    @users.each do |record|
      if record.email == user.email || record.username == user.username
        return false
      end
    end
    
    sql = 'INSERT INTO users (email, password, name, username) VALUES($1, $2, $3, $4)'
    params = [user.email, user.password, user.name, user.username]

    DatabaseConnection.exec_params(sql, params)
    return true
  end
end