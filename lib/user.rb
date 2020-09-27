require 'pg' 
require_relative 'database_connection'
require_relative 'database_connection_setup'

class User

attr_reader :id, :username, :email

  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.create(username:, password:, email:)
    result = DBconnect.query("INSERT INTO users (username, password, email) VALUES('#{username}', '#{password}', '#{email}') RETURNING id, username, email;")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end

end