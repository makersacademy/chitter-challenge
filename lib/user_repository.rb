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
    user_repo = UserRepository.new
    users = user_repo.all

    user_names = []
    emails = []
    users.each do |user|
      user_names << user.user_name
      emails << user.email
    end

    if emails.include?(email) || user_names.include?(user_name)
      return false
    else
      sql = 'INSERT INTO users (name, email, user_name, password, logged_in) VALUES ($1, $2, $3, $4, $5);'
      result_set = DatabaseConnection.exec_params(sql,[name, email, user_name, password, false])
      return true
    end
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

  def check_logged_in(user_name)
    check_log_in_sql = 'SELECT id, user_name, logged_in FROM users WHERE user_name = $1;'
    check_result = DatabaseConnection.exec_params(check_log_in_sql,[user_name])

    user = User.new
    user.id = check_result[0]['id']
    user.user_name = check_result[0]['user_name']
    user.logged_in = check_result[0]['logged_in']
    
    user.logged_in == 't' ? true : false
  end

  def find_user_name(id)
    sql = 'SELECT user_name FROM users WHERE id = $1'
    result = DatabaseConnection.exec_params(sql, [id])
    user = User.new
    user.user_name = result[0]['user_name']
    return user.user_name
  end
end