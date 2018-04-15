require_relative 'db_connection'
require 'bcrypt'

class User
  extend DbConnection
  attr_reader :id, :email, :password, :user_name

  def initialize(id:, email:, user_name:)
    @id = id
    @email = email
    @user_name = user_name
  end

  def self.create(user_name:, email:, password:)
    password = BCrypt::Password.create(password)
    result = connection.exec("INSERT INTO users (user_name, email, password) VALUES('#{user_name}', '#{email}', '#{password}') RETURNING id, email")
    User.new(id: result[0]['id'], email: result[0]['email'], user_name: result[0]['name'])
  end

  def self.all
    connection.exec("SELECT * FROM users;").to_a
  end

  def self.login(email:, password:)
    result = connection.exec("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], email: result[0]['email'], user_name: result[0]['user_name'])
  end

  def self.find(id)
    result = connection.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], email: result[0]['email'], user_name: result[0]['user_name'])
  end
end
