require_relative 'users'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result = DatabaseConnection.exec_params(sql, [])

    result.map do |user|
      new_user = User.new(
        id: user['id'].to_i,
        username: user['username'],
        name: user['name'],
        password_hash: user['password_hash'],
        email: user['email']
      )
    end
  end
end
