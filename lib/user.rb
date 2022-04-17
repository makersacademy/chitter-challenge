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
    result = DatabaseConnection.query("INSERT INTO users(username, name, email, password) 
                                      VALUES($1, $2, $3, $4) 
                                      RETURNING id, username, name, email, password;", 
                                      [username, name, email, encrypted])
    User.new(id: result[0]['id'], username: result[0]['username'], name: result[0]['name'], 
             email: result[0]['email'], password: result[0]['password'])
  end

  def self.find(id = nil)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1;", [id])
    return unless result.any?
    User.new(id: result[0]['id'], username: result[0]['username'], name: result[0]['name'], 
             email: result[0]['email'], password: result[0]['password'])
  end

  def self.authenticate(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = $1", [username])
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], username: result[0]['username'], name: result[0]['name'], 
             email: result[0]['email'], password: result[0]['password'])
  end

  def self.check_usernames_and_emails(username:, email:)
    username_already_used = DatabaseConnection.query("SELECT * FROM users WHERE username = $1;", 
                                                     [username])
    email_already_used = DatabaseConnection.query("SELECT * FROM users WHERE email = $1;", [email])
    true if username_already_used.any? || email_already_used.any?
  end
end
