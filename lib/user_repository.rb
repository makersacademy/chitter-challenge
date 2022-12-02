require_relative 'user'

class UserRepository
  
  def find(id)
    sql = 'SELECT id, email_address, password FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.email_address = result_set[0]['email_address']
    user.password = result_set[0]['password']

    return user
  end 

  def create(user)
    sql = 'INSERT INTO users (email_address, password) VALUES ($1, $2);'
    result_set = DatabaseConnection.exec_params(sql, [user.email_address, user.password])

    return user
  end 
end
