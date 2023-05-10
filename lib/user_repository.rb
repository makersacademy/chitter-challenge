require_relative 'user'

class UserRepository
  def all
    users = []

    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      user = User.new
        user.id = record['id'].to_i
        user.name = record['name']
        user.username = record['username']
        user.email = record['email_address']
        user.password = record['password']
        users << user
    end
    return users
  end
end