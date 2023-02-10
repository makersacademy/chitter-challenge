require_relative './user'

class UserRepository
  def all
    sql = "SELECT * FROM users"
    records = DatabaseConnection.exec_params(sql, [])
    users = []

    records.each do |record|
      user = User.new
      user.id = record['id']
      user.username = record['username']
      user.password = record['password']
      user.email = record['email']
      users << user
    end

    return users
  end


  def create(user)
    sql = "INSERT INTO users (username, password, email) VALUES ($1, $2, $3)"
    sql_params = [user.username, user.password, user.email]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1'
    sql_params = [id]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def find_by_id(id)
    sql = 'SELECT * FROM users WHERE id = $1'
    sql_params = [id]
    results = DatabaseConnection.exec_params(sql, sql_params)
    result = results[0]
    user = User.new
    user.id = result['id']
    user.username = result['username']
    user.password = result['password']
    user.email = result['email']
    return user
  end

  def verify(username, password)
    repo = UserRepository.new
    all_users = repo.all
    username_verify = all_users.each do |user|
      return true if user.username == username
    end
    password_verify = all_users.each do |user|
      return true if user.password == password
    end

    if username_verify == true && password_verify == true
      return true
    else
      return false
    end
  end
end