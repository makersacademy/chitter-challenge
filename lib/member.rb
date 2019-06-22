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
    member = DatabaseConnection.query("INSERT INTO members (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email, password;")
    Member.new(id: member[0]['id'], name: member[0]['name'], username: member[0]['username'], email: member[0]['email'], password: member[0]['password'])
  end
end
