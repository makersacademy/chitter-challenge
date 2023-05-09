require 'bcrypt'
require_relative './user'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    records = DatabaseConnection.exec_params(sql, [])
    records.map { |record| create_user_from_record(record) }
  end

  def find(id)
    sql = 'SELECT * FROM users WHERE id = $1'
    records = DatabaseConnection.exec_params(sql, [id])
    return create_user_from_record(records.first)
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1'
    records = DatabaseConnection.exec_params(sql, [email])
    return create_user_from_record(records.first)
  end

  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)

    sql = 'INSERT INTO users (email, password, name, username)
             VALUES ($1, $2, $3, $4)'
    params = [user.email, encrypted_password, user.name, user.username]
    DatabaseConnection.exec_params(sql, params)
  end

  def username_exists?(username)
    sql = 'SELECT username FROM users WHERE username = $1'
    records = DatabaseConnection.exec_params(sql, [username])
    records.ntuples.positive?
  end
  
  def email_exists?(email)
    sql = 'SELECT email FROM users WHERE email = $1'
    records = DatabaseConnection.exec_params(sql, [email])
    records.ntuples.positive?
  end

  private

  def create_user_from_record(record)
    user = User.new
    user.id = record['id'].to_i
    user.email = record['email']
    user.password = record['password']
    user.name = record['name']
    user.username = record['username']
    return user
  end
end
