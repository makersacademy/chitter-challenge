require 'user'

class UserRepository

  def all
    all_users = []
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |entry|
      all_users << user_inflate(entry)
    end
    return all_users
  end

  def find(id)
    single_user = []
    sql = 'SELECT * FROM users WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    entry = result_set[0]
      single_user << user_inflate(entry)
    return single_user #or delete line above and use this instead: return user_inflate(entry)
  end

  def create(user)
    sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'
    sql_params = [user.name, user.username, user.email, user.password]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1;'
    sql_params = [id]
    DatabaseConnection.exec_params(sql, sql_params)
  end


  private 

  def user_inflate(entry)
    user = User.new
    user.id = entry["id"].to_i
    user.name = entry['name']
    user.username = entry['username']
    user.email = entry['email']
    user.password = entry['password']
    return user
  end

end
