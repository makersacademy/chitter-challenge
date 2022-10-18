require_relative 'user'
require 'bcrypt'

class UserRepository
  def all
    users = []
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.username = record['username']
      user.email = record['email']
      user.password = BCrypt::Password.create(record['password'])
      users << user
    end
    users
  end

  def create(new_user)
    # Encrypt the password to save it into the new database record.
    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = '
      INSERT INTO users (username, name, email, password)
        VALUES($1, $2, $3, $4);
    '
    sql_params = [
      new_user.username,
      new_user.name,
      new_user.email,
      encrypted_password
    ]

    DatabaseConnection.exec_params(sql, sql_params)
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?
    # Compare the submitted password with the encrypted one saved in the database
    BCrypt::Password.new(user.password) == submitted_password
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.username = result_set[0]['username']
    user.name = result_set[0]['name']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']

    user
  end
end
