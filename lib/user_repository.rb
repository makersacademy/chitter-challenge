require_relative 'user'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    results_set = DatabaseConnection.exec_params(sql, [])
    all_users = results_set.map { |record| convert_to_user(record) }
    return all_users
  end

  def find(id)
    sql = 'SELECT id, name, user_name, email, password FROM users WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])
    user = convert_to_user(result[0])
    return user
  end

  private 

  def convert_to_user(record)
    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.user_name = record['user_name']
    user.email = record['email']
    user.password = record['password']
    return user
  end
end