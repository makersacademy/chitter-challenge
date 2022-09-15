require_relative 'user'

class UserRepository
  def all
    users = []

    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])    

    result_set.each do |record|

      user = User.new
      user.id = record['id'].to_i
      user.email = record['email']
      user.password = record['password']
      user.f_name = record['f_name']
      user.handle = record['handle']

      users << user
    end

    return users
  end

end