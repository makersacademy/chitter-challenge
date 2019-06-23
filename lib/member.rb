require_relative 'database_connection'
require 'bcrypt'
require 'pg'

class Member

  attr_reader :id, :name, :username, :email

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name:, username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    member = DatabaseConnection.query(
      "INSERT INTO members (name, username, email, password)
      VALUES('#{name}', '#{username}', '#{email}', '#{encrypted_password}')
      RETURNING id, name, username, email;")
    Member.new(
      id: member[0]['id'],
      name: member[0]['name'],
      username: member[0]['username'],
      email: member[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query(
      "SELECT * FROM members WHERE id = '#{id}';")
    Member.new(
      id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query(
      "SELECT * FROM members WHERE email = '#{email}';")

    return unless result.any?
    
    Member.new(
      id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      email: result[0]['email'])
  end
end
