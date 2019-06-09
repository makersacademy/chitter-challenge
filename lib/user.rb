require 'pg'
require_relative 'database_connection'
require 'bcrypt'

class User

  def self.create(author, handle, email, password)
    encrypted_password = BCrypt::Password.create(password)
    DatabaseConnection.query("INSERT INTO users(author, handle, email, password) 
                              VALUES('#{author}', '#{handle}', '#{email}', '#{encrypted_password}')")
  end

  attr_reader :id, :author, :handle, :email, :password

  def initialize(author, handle, email, id)
    @author = author
    @handle = handle
    @email = email
    @id = id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map{ |user| User.new(user['author'], user['handle'], user['email'], user['password']) }
  end

# OUTSTANDING: Authentication feature - confused on how to create and call out id attribute in #authenticate and #create instance class method... 
  # def self.authenticate(handle, password) 
  #   result = DatabaseConnection.query("SELECT * FROM users 
  #                                      WHERE handle = '#{handle}'")
  #   User.new(result[0]['id'], result[0]['handle'], result[0]['email'], result[0]['password'])
  # end

end