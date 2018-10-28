require 'pg'

class User

  attr_reader :id, :email, :username, :name

  def self.sign_up(email:, password:, name:, username:)
    result = DatabaseConnection.query("INSERT INTO users (email, password, name, username) VALUES ('#{email}', '#{password}', '#{name}', '#{username}') RETURNING id, email, username, name;")
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'], name: result[0]['name'])
  end

  def initialize(id:, email:, username:, name:)
    @id = id
    @username = username
    @email = email
    @name = name
  end

  def self.details(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id};")
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'], name: result[0]['name'])
  end

end
