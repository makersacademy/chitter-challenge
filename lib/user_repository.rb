require_relative './user'

class UserRepository
  def find(id)
    sql = 'SELECT * FROM users WHERE id = $1'
    records = DatabaseConnection.exec_params(sql, [id])
    return create_user_from_record(records.first)
  end

  private

  def create_user_from_record(record)
    user = User.new
    user.id = record['id'].to_i
    user.email = record['email']
    user.password = record['password']
    user.name = record['name']
    user.username = record['username']
    return user
  end
end
