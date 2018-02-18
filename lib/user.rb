require 'bcrypt'
require 'pg'

class User

  attr_reader :id, :email, :password

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password']) }
  end

  def self.create(options)
    password = BCrypt::Password.create(options[:password])
    result = DatabaseConnection.query("INSERT INTO users (email, password)
    VALUES('#{options[:email]}', '#{password}') RETURNING id, email, password;")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query("SELECT * FROM users
    WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

end
