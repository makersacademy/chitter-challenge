require_relative 'database_connection'

class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name:, username:, email:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (name, username, email, password) VALUES(
        '#{name}', '#{username}', '#{email}', '#{password}'
      ) RETURNING id, name, username, email, password;")
    User.new(
      id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password'])
  end

  def self.find(user_id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{user_id};")
    User.new(
      id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password'])
  end

  def self.username_exists?(username)
    !!DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';").first
  end

  def self.email_exists?(email)
    !!DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';").first
  end

  def self.login(username:, password:)
    unless User.username_exists?(username) && User.password_matches?(username, password)
      return false 
    end

    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';")
    User.new(
      id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password'])
  end

  def self.password_matches?(username, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username = '#{username}';").first
    result['password'] == password
  end
end
