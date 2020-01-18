require_relative 'database_connection'
require 'bcrypt'

class User
  attr_reader :id, :name, :username, :email
  
  def self.create(name:, username:, email:, password:)
    user = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email;")
    User.new(id: user[0]['id'], name: user[0]['name'], username: user[0]['username'], email: user[0]['email'])
  end

  def self.find(id:)
    user = DatabaseConnection.query("SELECT id, name, username, email FROM users WHERE id='#{id}'")
    User.new(id: user[0]['id'], name: user[0]['name'], username: user[0]['username'], email: user[0]['email'])
  end

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end
end
