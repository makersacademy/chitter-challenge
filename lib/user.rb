require './lib/database_connection'
require 'bcrypt'

class User
  attr_reader :id, :first_name, :last_name, :username, :email

  def initialize(id:, first_name:, last_name:, username:, email:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @username = username
    @email = email
  end

  def self.create(first_name:, last_name:, username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO
      users(firstname, lastname, username, email, password)
      VALUES('#{first_name}',
        '#{last_name}',
        '#{username}',
        '#{email}',
        '#{encrypted_password}')
    RETURNING id, firstname, lastname, username, email;")

    User.new(id: result[0]['id'],
      first_name: result[0]['firstname'],
      last_name: result[0]['lastname'],
      username: result[0]['username'],
      email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")

    User.new(id: result[0]['id'],
      first_name: result[0]['firstname'],
      last_name: result[0]['lastname'],
      username: result[0]['username'],
      email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users
      WHERE email = '#{email}'")

    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'],
      first_name: result[0]['firstname'],
      last_name: result[0]['lastname'],
      username: result[0]['username'],
      email: result[0]['email'])
  end
end
