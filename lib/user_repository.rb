require_relative './user.rb'
require 'bcrypt'

class UserRepository

  def all
    sql = 'SELECT id, email, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    users = []
    
    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.email = record['email']
      user.password = record['password']
    users << user
    end
    return users
  end

  def find(email)
    sql = 'SELECT id, email, password FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])

    user = User.new
    user.id = result_set[0]['id']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']

    return user
  end

  def create(new_user)
    # Encrypt the password to save it into the new database record.


    sql = 'INSERT INTO users (email, password) VALUES($1, $2);'
    sql_params = [new_user.email, new_user.password]
    result_set = DatabaseConnection.exec_params(sql, sql_params)

    return new_user
  end

  def sign_in(email, password)
    user = find(email)

    return nil if user.nil?

    # Compare the submitted password with the encrypted one saved in the database
    if password == user.password
      return true
    else
      return false
    end
  end
end