# ./lib/users

require_relative './database_connection'

class Users
  attr_accessor :logged_in, :username
  attr_reader :id
  
  def initialize(id:, username:)
    @logged_in = false
    @username = username
    @id = id
  end

  def self.username_available(username)
    result = DatabaseConnection.query(
      "SELECT * from users WHERE peeper = $1",
      [username]
    )
    if result.cmdtuples == 0
      true
    else
      false
    end
  end

  def self.signup(username)
    signup = DatabaseConnection.query(
      "INSERT INTO users (peeper) VALUES ($1) RETURNING id, peeper;",
      [username]
    )
    puts signup[0]['id']
    puts signup[0]['peeper']
    return Users.new(id: signup[0]['id'], username: signup[0]['peeper'])
  end


end