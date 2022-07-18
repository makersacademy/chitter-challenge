require_relative './user'

class UserRepository

  def all
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []
    result_set.map do |record|
      users << record_to_user_object(record)
    end
    return users
  end

  def find(id)
    sql = 'SELECT * FROM users WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    return "No record found" if result_set.to_a.length == 0
    record = result_set[0]
    return record_to_user_object(record)
  end

  def create(user)
    # to add encryption
    # encrypted_password = BCrypt::Password.create(new_user.password)
    sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'
    # to replace password with encrypted_password
    params = [user.name, user.username, user.email, user.password]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1;'
    params = [email]
    result_set = DatabaseConnection.exec_params(sql, params)
    return nil if result_set.to_a.length == 0
    record = result_set[0]
    return record_to_user_object(record)
  end

  def email_exists?(email)
    return !find_by_email(email).nil?
  end

  def username_exists?(username)
    sql = 'SELECT * FROM users WHERE username = $1;'
    params = [username]
    result_set = DatabaseConnection.exec_params(sql, params)
    return !result_set.to_a.empty?
  end

  private

  def record_to_user_object(record)
    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']
    return user
  end

end
  