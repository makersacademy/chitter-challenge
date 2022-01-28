require_relative 'database_connection'
require 'bcrypt'

class User
  def self.create(username:, handle:, password: )
    encrypted_pw = BCrypt::Password.create(password)

    result = DatabaseConnection.query(
      "INSERT INTO users (username, handle, password) "\
      "VALUES($1, $2, $3) "\
      "RETURNING id, username, handle;",
      [username, handle, encrypted_pw]
      )
    User.new(
      id: result[0]['id'],
      username: result[0]['username'],
      handle: result[0]['handle']
      ) # implementing the pattern of 'wrapping database data in program objects'. That is: User.create returns a User instance.
  end 

  attr_reader :id, :username, :handle

  def initialize(id:, username:, handle:)
    @id = id
    @username = username
    @handle = handle
  end

  def self.find(id:)
    return nil unless id #guard clause for cases where session[:user_id] is nil
    #return nil if id.nil?
    p id 
    p result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1;", [id])
   
    p User.new(id: result[0]['id'], username: result[0]['username'], handle: result[0]['handle'])
  end

  def self.authenticate(username: , password: )

    result = DatabaseConnection.query(
      'SELECT * FROM users WHERE username = $1', [username]
    )
    return unless result.any? # so that .authenticate returns nil if user isn't found on db
    return unless BCrypt::Password.new(result[0]['password']) == password # BCrypt's .new method reads the encrpted pw back to normal pw

    User.new(id: result[0]['id'], username: result[0]['username'], handle: result[0]['handle'])
  end

end