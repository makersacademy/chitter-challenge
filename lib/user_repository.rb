require 'digest'

class UserRepository
  def add_user(user)
    encrypted_password = Digest::SHA256.hexdigest(user.password)[0..20]
    # Encrypts password
    # Executes sql: (where password is encrypted)
    sql = 'INSERT INTO users (name, username, password, email) VALUES ($1, $2, $3, $4);'
    params = [user.name, user.username, encrypted_password, user.email]
    DatabaseConnection.exec_params(sql, params)
    # Returns nothing
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?

    submitted_password_encrypted = Digest::SHA256.hexdigest(submitted_password)[0..20]
    # Executes sql: 
    sql = 'SELECT id, name, username, password FROM users WHERE username = $1;'
    result = DatabaseConnection.exec_params(sql, [user.username])
    
    if submitted_password_encrypted == result[0]['password']
      return 'Sign in successful'
    else
      fail 'Password incorrect'
    end
    # checks encrypted password against inputted password when user attempts to log in
  end

  def find_by_email(email)
    sql = 'SELECT id, name, username, password, email FROM users WHERE email = $1'
    result = DatabaseConnection.exec_params(sql, [email])

    user = User.new
    user.id = result[0]['id'].to_i
    user.name = result[0]['name']
    user.username = result[0]['username']
    user.password = result[0]['password']
    user.email = result[0]['email']
    
    return user
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    sql = 'SELECT id, name, username, password, email FROM users WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result[0]['id'].to_i
    peep.name = result[0]['name']
    peep.username = result[0]['username']
    peep.password = result[0]['password']
    peep.email = result[0]['email']

    # Returns a single peep object.
    peep
  end

  def delete(user)
    # Executes the SQL query:
    sql = 'DELETE FROM users WHERE id = $1 '
    DatabaseConnection.exec_params(sql, [user.id])

    user
  end
end