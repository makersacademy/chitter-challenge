require 'bcrypt'

class User
  attr_reader :id, :name, :email, :username

  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name:, username:, email:, password:)
    return nil if duplicate_username?(username)
    return nil if duplicate_email?(email)

    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES ('#{name}', '#{username}', '#{email}', '#{encrypted_password}') RETURNING id, name, username, email;")

    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")

    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")

    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end

  private_class_method

  def self.duplicate_username?(username)
    username = DatabaseConnection.query("SELECT username FROM users WHERE username = '#{username}';")
    username.any?
  end  

  def self.duplicate_email?(email)
    email = DatabaseConnection.query("SELECT email FROM users WHERE email = '#{email}';")
    email.any?
  end
end
