require_relative './user'
require_relative './encrypted_password'

class UserRepository

  def all
    sql = 'SELECT id, name, email, password, username FROM users;'
    result_set = DatabaseConnection.exec_params(sql,[])

    users = []
    result_set.each do |record|
      users << record_to_user_object(record)
    end

    return users
  end

  def find_by_email(email)
    sql = 'SELECT id, name, email, password, username FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])
    record = result_set[0]
    return record_to_user_object(record)
  end

      # Insert new user 
    # item is a new User object
  def create(user)
    new_password = EncryptedPassword.new(user.password)
    encrypted_password = new_password.encrypted_password

    sql = 'INSERT INTO users (name, email, password, username) VALUES($1, $2, $3, $4);'
    params = [user.name, user.email, encrypted_password, user.username]
    DatabaseConnection.exec_params(sql, params)

    return nil
  end

  private

  def record_to_user_object(record)
    user = User.new
    user.id = record["id"].to_i
    user.name = record["name"]
    user.email = record["email"]
    user.password = record["password"]
    user.username = record["username"]

    return user
  end

end
