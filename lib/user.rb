require 'pg'
require 'bcrypt'

class User

  attr_reader :id, :email, :username, :name

  def self.sign_up(email:, password:, name:, username:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password, name, username) VALUES ('#{email}', '#{encrypted_password}', '#{name}', '#{username}') RETURNING id, email, username, name;")
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'], name: result[0]['name'])
  end

  def self.sign_in(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}'")
    return nil unless result.any?
    return nil unless BCrypt::Password.new(result[0]['password']) == password
    user = User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'], name: result[0]['name'])
  end

  def initialize(id:, email:, username:, name:)
    @id = id
    @username = username
    @email = email
    @name = name
  end

  def self.details(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'], name: result[0]['name'])
  end

end
