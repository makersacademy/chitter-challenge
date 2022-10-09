require_relative 'user'

class UserRepository
  def all
    users = []
    sql = "SELECT * FROM users;"
    records = DatabaseConnection.exec_params(sql, [])
    records.each do |record|
      users << record_to_user_object(record)
    end

    return users
  end

  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)
    sql = "INSERT INTO users (#{user_details}) VALUES ($1, $2, $3, $4, $5);"
    sql_params = [user.first_name, user.last_name, user.username, user.email, encrypted_password]
    DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end
  
  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?

    # Compare the submitted password with the encrypted one saved in the database
    submitted_password == BCrypt::Password.new(user.password) ? true : false
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1;'
    record = DatabaseConnection.exec_params(sql, [email]).first
    record_to_user_object(record)
  end

  def find_by_username(username)
    if not all.any?{|record| record.username == username}
      return false
    end
    sql = 'SELECT * FROM users WHERE username = $1'
    sql_params = [username]
    record = DatabaseConnection.exec_params(sql, sql_params).first
    return record_to_user_object(record)
  end

  private

  def record_to_user_object(record)
    user = User.new
    user.id = record['id'].to_i
    user.first_name = record['first_name']
    user.last_name = record['last_name']
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']

    user
  end

  def user_details
    'first_name, last_name, username, email, password'
  end
end