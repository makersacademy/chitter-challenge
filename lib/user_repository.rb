class UserRepository

  def all
    users = []

    sql = 'SELECT id, name, username, email_address, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record| 
      user = User.new 
      user.id = record['id'].to_i
      user.name = record['name']
      user.username = record['username']
      user.email_address = record['email_address']
      user.password = record['password'].strip

      users << user
    end 

    return users
  end

 
  def find(id)
    sql = 'SELECT id, name, username, email_address, password FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    user = User.new 
    user.id = result_set[0]['id'].to_i
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']
    user.email_address = result_set[0]['email_address']
    user.password = result_set[0]['password'].strip

    return user
  end


  def create(user)
    sql = 'INSERT INTO users (name, username, email_address, password) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [user.name, user.username, user.email_address, user.password])

    return user
  end

 
end