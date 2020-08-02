require 'database_connection'

class User

  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

  def self.create(email:, password:, name:, username:)
    result = DatabaseConnection.query("INSERT INTO users (email, password, name, username) VALUES('#{email}', '#{password}','#{name}', '#{username}') RETURNING id, email, name, username;")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'], username: result[0]['username'] )
  end



end
