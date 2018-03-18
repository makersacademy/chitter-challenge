require 'bcrypt'

class User
  attr_reader :id, :email, :password, :username, :name

  def initialize(id, name, username, email, password)
    @id = id
    @email = email
    @password = password
    @username = username
    @name = name
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], name['name'], user['username'], user['email'], user['password']) }
  end

  def self.create(options)
    password = BCrypt::Password.create(options[:password])
    result = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES('#{options[:name]}', '#{options[:username]}', '#{options[:email]}', '#{password}') RETURNING id, name, username, email, password;")
    User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
  end

  def self.exists?(column, value)
    result = DatabaseConnection.query("SELECT * FROM users WHERE #{column} = '#{value}'")
    result.any?
  end

end
