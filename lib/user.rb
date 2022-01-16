require_relative 'database_connection'

class User
  def self.create(username:, handle:, password: )
    result = DatabaseConnection.query("INSERT INTO users (username, handle, password) VALUES($1, $2, $3) RETURNING id, username, handle;", [username, handle, password])
    User.new(id: result[0]['id'], username: result[0]['username'], handle: result[0]['handle']) # implementing the patter of 'wrapping database data in program objects'. That is: User.create returns a User instance.
  end 

  attr_reader :id, :username, :handle

  def initialize(id:, username:, handle:)
    @id = id
    @username = username
    @handle = handle
  end

  def self.find(id:)
    return nil unless id #guard clause for cases where session[:user_id] is nil
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1", [id])
   
    User.new(id: result[0]['id'], username: result[0]['username'], handle: result[0]['handle'])
  end

end