require_relative './user'
require 'bcrypt'

class UserRepository

  def all
    query = 'SELECT * FROM users;'
    result = DatabaseConnection.exec_params(query, [])

    users = []

    result.each do |record|
      users << create_user_object(record)
    end

    return users
  end

  def find(id)
    query = 'SELECT * FROM users WHERE id = $1;'
    param = [id]

    result = DatabaseConnection.exec_params(query, param)[0]

    return create_user_object(result)
  end

  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)

    query = '
    INSERT INTO users (email, password, name, username)
        VALUES ($1, $2, $3, $4);
    '
    params = [
      user.email,
      encrypted_password,
      user.name,
      user.username
    ]

    DatabaseConnection.exec_params(query, params)
  end

  def find_by_email(email)
    query = 'SELECT * FROM users WHERE email = $1;'
    param = [email]

    result = DatabaseConnection.exec_params(query, param)[0]

    return create_user_object(result)
  end


  private 

  def create_user_object(record)
    user = User.new
    user.id = record['id']
    user.email = record['email']
    user.password = record['password']
    user.name = record['name']
    user.username = record['username']

    return user
  end
end
