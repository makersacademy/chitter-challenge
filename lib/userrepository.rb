require_relative 'user'

class UserRepository

  def all
    sql = 'SELECT * FROM users;'
    result = DatabaseConnection.exec_params(sql, [])
    users = []
    result.each do |record|
      user = User.new
      user.id = record['id']
      user.username = record['username']
      user.email = record['email']
      user.password = record['password']
      users.push(user)
    end
    return users
  end

  def create(new_user)
    # Encrypt the password to save it into the new database record.
    # encrypted_password = BCrypt::Password.create(new_user.password)
    sql = 'INSERT INTO users (name, username, email, password) VALUES($1, $2, $3, $4);'
    sql_params = [new_user.name, new_user.username, new_user.email, new_user.password]
  end

end
