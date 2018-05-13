require './lib/database'
require 'bcrypt'

class User
  attr_reader :id, :email, :password

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    result = Database.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password']) }
  end

  def self.create(email, password)
    password = BCrypt::Password.create(password)
    result = Database.query("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email, password;")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  def self.find(id)
    return nil unless id
    result = Database.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

  def self.authenticate(email, password)
    result = Database.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    @user = User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

end
