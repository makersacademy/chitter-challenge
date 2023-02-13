require_relative './user_repository.rb'
require 'bcrypt'

class UserRepository
  def all
    users = []

    sql = 'SELECT id, name, email, password, username FROM users;'

    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.email = record['email']
      user.password = record['password']
      user.username = record['username']

      users << user
    end
    return users
  end

  def create(user)
    # encrypts users password to a BSD hash
    encrypted_pass = BCrypt::Password.create(user.password)
    sql = 'INSERT INTO users (name, email, password, username) VALUES($1, $2, $3, $4);'
    params = [user.name, user.email, encrypted_pass, user.username]

    result_set = DatabaseConnection.exec_params(sql, params)

    return ''
  end

  def password
    @password ||= Password.new(password_hash)
  end


  def find_by_email(email)
    sql = 'SELECT id, email, password, name, username FROM users WHERE email = $1;'
    params = [email]

    record = DatabaseConnection.exec_params(sql,params).first
    return nil if record.nil?
    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.email = record['email']
    user.password = record['password']
    user.username = record['username']
    return maker
  end

  
end