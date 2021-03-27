require_relative './database_connection.rb'

class User
  attr_reader :name, :username, :email, :password
  def initialize(name, username, email, password)
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
  end
end