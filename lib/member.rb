require 'pg'
require_relative 'database_connection'

class Member

  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name:, username:, email:, password:)
    member = DatabaseConnection.query(
      "INSERT INTO members (name, username, email, password)
      VALUES('#{name}', '#{username}', '#{email}', '#{password}')
      RETURNING id, name, username, email, password;")
    Member.new(
      id: member[0]['id'],
      name: member[0]['name'],
      username: member[0]['username'],
      email: member[0]['email'],
      password: member[0]['password'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query(
      "SELECT * FROM members WHERE id = '#{id}';")
    Member.new(
      id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password'])
  end
end
