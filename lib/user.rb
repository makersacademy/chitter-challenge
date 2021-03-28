# require 'pg' # I think this is redundent
require_relative './database_connection.rb'
require 'bcrypt'

class User

  attr_reader :id, :email, :username

  def initialize(id:, email:, username:)
    @id = id
    @email = email
    @username = username
  end

  def self.add(email:, password:, username:)
    safe_password =  BCrypt::Password.create(password)
    data = DatabaseConnection.query("INSERT INTO users (email, password, username ) VALUES('#{email}', '#{safe_password}', '#{username}') 
    RETURNING id, email, username;")
    User.new(id: data[0]['id'], email: data[0]['email'], username: data[0]['username'])
  end 

  def self.find(id:)
    return nil unless id
    data = DatabaseConnection.query("SELECT id, email, username FROM users WHERE id = '#{id}';") 
    User.new(id: data[0]['id'], email: data[0]['email'], username: data[0]['username'])
  end 

  def self.authenticate(email:, password:)
    data = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    @user = User.new(id: data[0]['id'], email:  data[0]['email'], username: data[0]['username'])
  end 

  



end 
