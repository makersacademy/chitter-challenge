require_relative 'user'
class UserRepository
  def all
    users = []
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql,[])

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.email = record['email']
      user.user_name = record['user_name']
      user.password = record['password']
      user.logged_in = record['logged_in']
      users << user
    end
    return users
  end
  
  def sign_up(name, email, user_name, password)
    sql = 'INSERT INTO users (name, email, user_name, password, logged_in) VALUES ($1, $2, $3, $4, $5)'
    result_set = DatabaseConnection.exec_params(sql,[name, email, user_name, password, false])
  end

  def log_in(user_name, password)
    sql = 'SELECT id, name, email, user_name, password FROM users WHERE user_name = $1;'
    result_set = DatabaseConnection.exec_params(sql, [user_name])
    user = User.new

    user.id = result_set[0]['id']
    user.name = result_set[0]['name']
    user.email = result_set[0]['email']
    user.user_name = result_set[0]['user_name']
    user.password = result_set[0]['password']
    user.logged_in = result_set[0]['logged_in']
    

    if user.password == password
      change_log_in_sql = "UPDATE users SET logged_in=TRUE WHERE id=$1;"
      result_set = DatabaseConnection.exec_params(change_log_in_sql,[user.id])
      return "You are logged in"
    else
      return "Incorrect password or user name"
    end
  end
end

# Get the whole db record for the row that the username is in
# Assign each to an instance of User.new
# check user.password == password
# if it is changed logged_in in db to true
# else return 'password or username is incorrect