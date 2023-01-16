
require_relative './user'

class UserRepository

  def all
    users = []

    sql = "SELECT id, username, email_address, registration_date FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.username = record['username']
      user.email_address = record['email_address']
      user.registration_date = record['registration_date']

      users << user
    end
    return users
  end 

  def find(id)
    sql = 'SELECT id, username, email_address, registration_date FROM users WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])
      user = User.new
      user.id = result[0]['id'].to_i
      user.username = result[0]['username']
      user.email_address = result[0]['email_address']
      user.registration_date = result[0]['registration_date']
    return user
  end

  def find_user(username)
      sql = 'SELECT id, username, email_address, registration_date FROM users WHERE username = $1;'
      result = DatabaseConnection.exec_params(sql, [username])
        user = User.new
        user.id = result[0]['id'].to_i
        user.username = result[0]['username']
        user.email_address = result[0]['email_address']
        user.registration_date = result[0]['registration_date']
      return user
  end 

  # Time.now('%d-%m-%Y')
  def create(user)
   sql = 'INSERT INTO users (username, email_address, registration_date) VALUES ($1, $2, $3);'
   result = DatabaseConnection.exec_params(sql, [user.username, user.email_address, user.registration_date])
   return user
  end 


end