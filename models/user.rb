require 'pg'
require_relative 'database_connection'
require './spec/database_connection_setup'

class User

  def initialize(username = nil, name = nil, email = nil, password = nil)
    @username = username
    @name = name
    @email = email
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map { |user| [user['username'], user['name'], user['email']] }
  end

  def self.add(username, name, email, password)
    result = DatabaseConnection.query("INSERT INTO users (username, name, email, password) 
                                      VALUES('#{username}', '#{name}', '#{email}', '#{password}') 
                                      RETURNING username, name, email, password;")
    User.new(result[0]['username'], result[0]['name'], result[0]['email'], result[0]['password'])
  end

end