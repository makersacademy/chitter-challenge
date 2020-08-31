require 'pg'
require 'bcrypt'

class User

  attr_reader :id, :username, :email, :password

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.new_user(username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{encrypted_password}') RETURNING id, username, email, password;")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.login(username:, password:)
    return "Wrong username" if check(username)

    result = DatabaseConnection.query("SELECT * FROM users WHERE username='#{username}';")
    return "Wrong password" unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.check(username)
    result = DatabaseConnection.query("SELECT email FROM users WHERE username='#{username}';")
    result.first.nil?
  end

end
