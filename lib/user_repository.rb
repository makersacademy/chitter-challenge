require_relative 'user'

class UserRepository
  def all
    sql = 'SELECT id, username, email_address, password FROM users;'
    params = []
    result_set = DatabaseConnection.exec_params(sql, params)

    users = []
        
    result_set.each do |record|
      users << object_to_user(record)
    end
    return users
  end

  def find(id)
    sql = 'SELECT id, username, email_address, password FROM users WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)

    object_to_user(result[0])
  end

  def create(user)
    sql = 'INSERT INTO users (username, email_address, password) VALUES ($1, $2, $3);'
    result = DatabaseConnection.exec_params(sql, [user.username, user.email_address, user.password])

    return user
  end

  def object_to_user(record)
    user = User.new
    user.id = record['id'].to_i
    user.username = record['username']
    user.email_address = record['email_address']
    user.password = record['password']

    return user
  end
end
