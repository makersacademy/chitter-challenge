require_relative 'user'

class UserRepository
  def all
    users = []

    sql = 'SELECT id, name, username, email_address, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|

      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.username = record['username']
      user.email_address = record['email_address']
      user.password = record['password']

      users << user
    end
      return users
    end

  def find(id)
    sql = 'SELECT id, name, username, email_address, password FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']
    user.email_address = result_set[0]['email_address']
    user.password = result_set[0]['password']

    return user
  end

  def create(user)
    sql = 'INSERT INTO users (name, username, email_address, password) VALUES($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [user.name, user.username, user.email_address, user.password])

    return user
  end

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1;'
    sql_params = [id]

    DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end

  def update(user)
    sql = 'UPDATE users SET name = $1, username = $2, email_address = $3, password = $4 WHERE id = $5;'
    sql_params = [user.name, user.username, user.email_address, user.password, user.id]

    DatabaseConnection.exec_params(sql, sql_params)
  
    return nil
  end
end
