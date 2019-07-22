require 'pg'
require_relative 'database_connection'
require_relative 'database_connection_setup'

class User

  attr_reader :id, :name, :email, :username, :password

  def initialize(id: id, name: name, email: email, username: username, password: password)
    @id = id
    @name = name
    @email = email
    @username = username
    @password = password
  end

  def self.create(id: id, name: name, email: email, username: username, password: password)
    result = DatabaseConnection.query("INSERT INTO users (name, email, username, password) VALUES('#{name}', '#{email}', '#{username}', '#{password}') RETURNING id, name, email, username, password;")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  end

end
