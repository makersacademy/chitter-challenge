require_relative "user"

class UserRepository

  def all
    users = []

    # Send the SQL query and get the result set.
    sql = 'SELECT id, name, username, email, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |user|

      # Create a new model object
      # with the record data.
      user = User.new
      user.id = user['id'].to_i
      user.name = user['name']
      user.username = user['username']
      user.email = user['email']
      user.password = user['password']

      users << user
    end

    def find_by_email(email)
        sql = 'SELECT email, FROM users WHERE email = $1;'
        result_set = DatabaseConnection.exec_params(sql, [email])
    
        user = User.new
        user.id = result_set[0]['id'].to_i
        user.name = result_set[0]['name']
        user.username = result_set[0]['username']
        user.password = result_set[0]['password']
  
  
      return user
      end



  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?

    encrypted_submitted_password = BCrypt::Password.create(submitted_password)

    if user.password == encrypted_submitted_password
      return erb(:login_success)
    else
      return erb(:login_error)
    end
  end

  
  def create(new_user)
      encrypted_password = BCrypt::Password.create(new_user.password)
  
      sql = '
        INSERT INTO users (name, username, email, password)
          VALUES($1, $2);
      '
      sql_params = [
        new_user.name,
        new_user.username,
        new_user.email,
        encrypted_password
      ]
    end
  end
end