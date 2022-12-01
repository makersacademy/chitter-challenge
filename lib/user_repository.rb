require_relative 'user'

class UserRepository

  def all
    users = []

    sql = 'SELECT id, name, email_address, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|

      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.email_address = record['email_address']
      user.password = record['password']

      users << user
    end

    return users
  end
end