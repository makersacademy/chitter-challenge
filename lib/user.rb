require 'pg'
require './lib/db_connection'

class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.add(name:, username:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO peeps(name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, name, username, email, password;")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map { |user| User.new(id: user['id'], name: result[0]['name'], username: user['username'], email: user['email'], password: user['password']) }
  end
end
