require 'pg'
require_relative 'database_connection'
require './spec/database_connection_setup'

class User

  def initialize(username = nil, email = nil)
    @username = username
    @email = email
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map { |user| [user['username'], user['email']] }
  end

  def self.add(username, email, password)
    result = DatabaseConnection.query("INSERT INTO users (username, email, password) 
                                      VALUES('#{username}', '#{email}', '#{password}') 
                                      RETURNING username, email;")
    User.new(result[0]['username'], result[0]['email'])
  end

end