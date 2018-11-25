require 'bcrypt'
require_relative './database_connection'

class User

  attr_reader :id, :name, :email, :password

  def initialize(id:, name:, email:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end  

  def self.create(name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES('#{name}', '#{email}', '#{encrypted_password}') RETURNING id, name, email;")
    User.new(
      id: result[0]['id'],
      name: result[0]['name'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(
      id: result[0]['id'],
      name: result[0]['name'],
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
      name: result[0]['name'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end

end
