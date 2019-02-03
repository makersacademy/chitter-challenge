require 'pg'
require 'bcrypt'
require_relative './database_connection'


class User

  attr_reader :id, :email, :password

  def initialize(id:, email:, password:)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map { |user|
      User.new(
        id: user['id'], 
        email: user['email'], 
        password: user['password']
        )
    }
  end

  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
      "INSERT INTO users (email, password) 
      VALUES('#{email}', '#{encrypted_password}') 
      RETURNING id, email, password;"
      )
    User.new(
      id: result[0]['id'], 
      email: result[0]['email'], 
      password: result[0]['password']
      )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE id = #{id}"
      )
    User.new(
      id: result[0]['id'], 
      email: result[0]['email'], 
      password: result[0]['password']
      )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(
      id: result[0]['id'], 
      email: result[0]['email'], 
      password: result[0]['password']
      )
  end
end
