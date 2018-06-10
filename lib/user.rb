require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :email, :username, :name, :password

  def initialize(id, email, username, name, password)
    @id = id
    @email = email
    @username = username
    @name = name
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map do |user|
      User.new(
        user['id'],
        user['email'],
        user['username'],
        user['name'],
        user['password'])
    end
  end

  def self.create(options)
    password = BCrypt::Password.create(options[:password])
    result = DatabaseConnection.query(
      "INSERT INTO users(email, username, name, password)
      VALUES('#{options[:email]}','#{options[:username]}',
       '#{options[:name]}','#{password}')
      RETURNING id, email, username, name, password;"
    )
    User.new(
      result[0]['id'],
      result[0]['email'],
      result[0]['username'],
      result[0]['name'],
      result[0]['password'],
      )
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(
      result[0]['id'],
      result[0]['email'],
      result[0]['username'],
      result[0]['name'],
      result[0]['password'],
      )
  end

  def self.authenticate(username, password)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE username = '#{username}'"
    )
    return unless result.any?
    User.new(
      result[0]['id'],
      result[0]['email'],
      result[0]['username'],
      result[0]['name'],
      result[0]['password'],
      )
  end
end
