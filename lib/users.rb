require 'pg'

class Users

  attr_reader :name, :username, :email, :password

  def initialize(name:, username:, email:, password:)
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.signup(name:, username:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING name")
    Users.new(
      name: result[0]['name'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end
end
