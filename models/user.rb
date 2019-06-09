require 'pg'
require 'bcrypt'
require '../db/database'

class User

  attr_reader :name, :username, :email, :id
  
  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @email = email
    @username = username
  end

  def self.all 
    result = Database.query("SELECT * FROM users")
    result.map do |user|
      User.new(id: user['id'], name: user['name'], username: user['username'], email: user['email'])
    end
  end

  def self.create(name:, username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = Database.query("INSERT INTO users (username, name, email, password) VALUES('#{username}', '#{name}', '#{email}', '#{encrypted_password}') RETURNING id, username, name, email")
    p result
    p 
    user = User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
    p user
    query = Database.query("SELECT FROM users WHERE name = 'Egle'")
  end

  def self.find(id)
    return nil unless id
    result = Database.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = Database.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end
end
