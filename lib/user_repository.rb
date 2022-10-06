require_relative 'user'

class UserRepository
  def all
    users = []
    sql = 'SELECT id, first_name, last_name, username, email, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      users << record_to_user_object(record)
    end

    return users
  end

  def create(user)
    sql = 'INSERT INTO users (first_name, last_name, username, email, password) VALUES ($1, $2, $3, $4, $5);'
    sql_params = [user.first_name, user.last_name, user.username, user.email, user.password]
    DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end

  private

  def record_to_user_object(record)
    user = User.new
    user.id = record['id'].to_i
    user.first_name = record['first_name']
    user.last_name = record['last_name']
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']

    user
  end
end