require_relative './user'

class UserRepository
  def all
    sql = 'SELECT id, username, pass, full_name, email FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    users = []

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.username = record['username']
      user.pass = record['pass']
      user.full_name = record['full_name']
      user.email = record['email']

      users << user
    end
    
    return users
  end

  def find(id)
    sql = 'SELECT id, username, pass, full_name, email FROM users WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]

    user = User.new
    user.id = record['id']
    user.username = record['username']
    user.pass = record['pass']
    user.full_name = record['full_name']
    user.email = record['email']

    return user
  end

  def create(user)
    sql = 'INSERT INTO users (username, pass, full_name, email) VALUES($1, $2, $3, $4);'
    sql_params = [user.username, user.pass, user.full_name, user.email]

    DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end

  # def delete(id)
  #   sql = 'DELETE FROM users WHERE id = $1;'
  #   sql_params = [id]

  #   DatabaseConnection.exec_params(sql, sql_params)

  #   return nil
  # end
end