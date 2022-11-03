require_relative './user'
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT id, name, username, email, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.username = record['username']
      user.email = record['email']
      user.password = record['password']

      users << user
    end
    return users
  end

  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)

    sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'
    sql_params = [user.name, user.username, user.email, user.password]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def login(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?

    if submitted_password == BCrypt::Password.new(user.password)
      true
    else
      false
    end
  end

   def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1;'
    result_set = DatabaseConnection.exec_params(sql, [email])

    user = User.new
    user.id = result_set[0]['id'].to_i
    user.name = result_set[0]['name']
    user.username = result_set[0]['username']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']

    return user
  end
end
