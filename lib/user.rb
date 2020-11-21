require 'database_connection'
require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :username, :email

  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.create(username:, email:, password:)
    salted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES ('#{username}', '#{email}', '#{salted_password}') RETURNING id, username, email;")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end
end