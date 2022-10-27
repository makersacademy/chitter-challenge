require_relative 'user'
require 'bcrypt'

class UserRepository
  def all
    users = []
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      user = User.new
      set_user(user, record)
      users << user
    end
    users
  end

  def create(new_user)
    # Encrypt the password to save it into the new database record.
    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = 'INSERT INTO users (username, name, email, password) VALUES($1, $2, $3, $4);'
    sql_params = [new_user.username, new_user.name, new_user.email, encrypted_password]

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

    return nil if result_set.cmd_tuples.zero?

    user = User.new
    find_user(user, result_set)
    user
  end

  def find_by_username(username)
    sql = 'SELECT * FROM users WHERE username = $1;'
    result_set = DatabaseConnection.exec_params(sql, [username])

    return nil if result_set.cmd_tuples.zero?

    user = User.new
    find_user(user, result_set)
    user
  end

  def find_by_id(id)
    sql = 'SELECT * FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    return nil if result_set.cmd_tuples.zero?

    user = User.new
    find_user(user, result_set)
    user
  end

  private

  def set_user(user, record)
    user.id = record['id'].to_i
    user.name = record['name']
    user.username = record['username']
    user.email = record['email']
    user.password = BCrypt::Password.create(record['password'])
  end

  def find_user(user, result_set)
    user.id = result_set[0]['id'].to_i
    user.username = result_set[0]['username']
    user.name = result_set[0]['name']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
  end
end
