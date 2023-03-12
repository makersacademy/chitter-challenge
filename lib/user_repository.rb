require_relative 'user'

class UserRepository
  def all_users
    users = []

    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.email = record['email']
      user.password = record['password']
      user.name = record['name']
      user.username = record['username']

      users << user
    end

    return users
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
end