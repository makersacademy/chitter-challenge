require_relative './user'
require 'bcrypt'
class UserRepository

  def all
    # SELECT * FROM users;
    # Returns an array of User objects.
    users = []
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql,[])

    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.email = record['email']
      user.password = record['password']
      user.name = record['name']
      user.username = record['username']

      users << user
    end
    return users
  end

  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)
    sql = 'INSERT INTO users (email,password,name,username) VALUES ($1, $2, $3,$4);'
    params = [user.email,encrypted_password,user.name,user.username]

    DatabaseConnection.exec_params(sql,params)

    return nil
  end

  def find(id)
    sql = 'SELECT * FROM users WHERE id = $1;'
    params = [id]

    result_set = DatabaseConnection.exec_params(sql,params)
    record = result_set[0]

    user = User.new
    user.id = record['id'].to_i
    user.email = record['email']
    user.password = record['password']
    user.name = record['name']
    user.username = record['username']

    return user
  end

  def user_exist?(user)
    username_sql = 'SELECT username FROM users WHERE username=$1;'
    username_result = DatabaseConnection.exec_params(username_sql,[user.username])

    email_sql = 'SELECT email FROM users WHERE email=$1;'
    email_result = DatabaseConnection.exec_params(email_sql,[user.email])

    if username_result.num_tuples.zero? == false
      return 'Username exists!'
    elsif email_result.num_tuples.zero? == false
      return 'Email exists!'
    else
      return false
    end
  end

  def check_credential(email,password)
    # sql = 'SELECT id FROM users WHERE email=$1 AND password=$2;'
    sql = 'SELECT id FROM users WHERE email=$1;'
    result = DatabaseConnection.exec_params(sql,[email])
    if result.num_tuples.zero? == false
      user = find(result[0]['id'])
      p 'step 1'
      if BCrypt::Password.new(user.password) == password
        p 'step 2'
        p user.id.to_i
      return user.id.to_i
      end
      # return result[0]['id'].to_i
    end
    return false
  end
end

