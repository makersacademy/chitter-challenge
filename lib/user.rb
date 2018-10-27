require_relative 'database_connection'
require 'bcrypt'

class User

  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name:, username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (name, username, email, password)
    VALUES('#{name}', '#{username}', '#{email}', '#{encrypted_password}')
    RETURNING id, name, username, email, password;")
    User.new(id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map do |user|
      User.new(id: result[0]['id'],
        name: result[0]['name'],
        username: result[0]['username'],
        email: result[0]['email'],
        password: result[0]['password']
      )
    end
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return nil unless result.any?
    return nil unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end
end
