require 'bcrypt'

class User
  attr_reader :id, :username, :name, :email, :password
  def initialize(id:, username:, name:, email:, password:)
    @id = id
    @username = username
    @name = name
    @email = email
    @password = password
  end

  def self.create(username:, name:, email:, password:)
    encrypted = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users(username, name, email, password) VALUES($1, $2, $3, $4) 
                                      RETURNING id, username, name, email, password;", [username, name, email, encrypted])
    User.new(id: result[0]['id'], username: result[0]['username'], name: result[0]['name'], 
             email: result[0]['email'], password: result[0]['password'])
  end

  def self.find(id = nil)
    return nil unless id != nil
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1;", [id])
    User.new(id: result[0]['id'], username: result[0]['username'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = $1", [username])
    User.new(id: result[0]['id'], username: result[0]['username'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
  end
  
end