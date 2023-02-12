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
    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = 'INSERT INTO users (name, username, email, password) VALUES($1, $2, $3, $4);'
    sql_params = [new_user.name, new_user.username, new_user.email, encrypted_password]
    DatabaseConnection.exec_params(sql,sql_params)
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?

    # Compare the submitted password with the encrypted one saved in the database
    if submitted_password == BCrypt::Password.new(user.password)
      return erb(:new_peep)
    else
      # wrong password
      return erb(:wrong_password_error)
    end
  end

    def find_by_email(email)
    sql = 'SELECT id, name, username, password FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']
    user.password = result_set[0]['password']

    return user
    end
end
