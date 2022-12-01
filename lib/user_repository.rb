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

  def find(email_address)
    sql = 'SELECT id, name, email_address, password FROM users WHERE email_address = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email_address])

     user = User.new
     user.id = result_set[0]['id']
     user.name = result_set[0]['name']
     user.email_address = result_set[0]['email_address']
     user.password = result_set[0]['password']

    return user
  end
end