require_relative './user'
require 'bcrypt'

class UserRepository
  def all
    users = []
    sql = 'SELECT id, name, username, email, password FROM users;'
    sql_params = []
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    result_set.each do |record|
      users << record_to_user_object(record)
    end
    return users
  end

  def check_if_username_or_email_taken(username, email)
    sql = 'SELECT username, email FROM users;'
    sql_params = []
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    username_taken = result_set.any? { |record| record['username'] == username }
    email_taken = result_set.any? { |record| record['email'] == email }

    username_taken or email_taken
  end

  def create(new_user)
    encrypted_password = BCrypt::Password.create(new_user.password)
    sql = 'INSERT INTO users (name, username, email, password) VALUES($1, $2, $3, $4);'
    sql_params = [new_user.name, new_user.username, new_user.email, encrypted_password]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end

  def find_by_id(user_id)
    sql = 'SELECT id, name, username, email, password FROM users WHERE id = $1;'
    sql_params = [user_id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    return record_to_user_object(record)
  end

  def find_by_username(username)
    sql = 'SELECT id, name, username, email, password FROM users WHERE username = $1;'
    sql_params = [username]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    return record_to_user_object(record)
  end

  private

  def record_to_user_object(record)
    user = User.new 
    user.id = record['id']
    user.name = record['name']
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']

    return user
  end
end