require 'pg'
require_relative 'database_connection'

class User
  attr_reader :author, :handle, :email, :password

  def initialize(author, handle, email, password)
    @author = author
    @handle = handle
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map{ |user| User.new(user['author'], user['handle'], user['email'], user['password']) }
  end

  def self.create(author, handle, email, password)
    encrypted_password = BCrypt::Password.create(password)
    DatabaseConnection.query("INSERT INTO users(author, handle, email, password) 
                              VALUES('#{author}', '#{handle}', '#{email}', '#{encrypted_password}')")
  end

end