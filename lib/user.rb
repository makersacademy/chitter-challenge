require 'bcrypt'

class User
  attr_reader :id, :username, :password, :email, :name

  def initialize(id:, username:, password:, email:, name:)
    @id = id
    @username = username
    @password = password
    @email = email
    @name = name
  end

  def self.list
    Database.query( "SELECT * FROM users" ).map do | row |
      User.new(id: row['id'], username: row['username'], password: row['password'], email: row['email'], name: row['name'])
    end
  end

  def self.add(username:, password:, email:, name:)
    encrypted_password = BCrypt::Password.create(password)
    result = Database.query( "INSERT INTO users(username, password, email, name) VALUES('#{username}', '#{encrypted_password}', '#{email}', '#{name}' ) RETURNING id, username, password, email, name;")
    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'], email: result[0]['email'], name: result[0]['name'])
  end

  def self.login(username:, password:)
    result = Database.query( "SELECT * FROM users WHERE username = '#{username}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], username: result[0]['username'], password: result[0]['password'], email: result[0]['email'], name: result[0]['name'])
  end
end
