require 'bcrypt'

class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map do |user|
      User.new(id: user['id'], name: user['name'], username: user['username'], email: user['email'], password: user['password'])
    end
  end

  def self.create(name, username, email, password)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users(name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{encrypted_password}') RETURNING id, name, username, email, password;")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.authenticate(username, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';")
    return unless result.any?
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end
end
