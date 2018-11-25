require 'bcrypt'
require_relative './database_connection.rb'
class User
  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, username:, name:)
    @id = id
    @email = email
    @username = username
    @name = name
  end

  def self.create(email:, password:, name:, username:)
    encrypted_password = BCrypt::Password.create(password)
    user = DatabaseConnection.query("INSERT INTO users (email, password, name, username) VALUES ('#{email}', '#{encrypted_password}', '#{name}', '#{username}') RETURNING id, email, username;")
    user.map do |peep|
      User.new(
        id: user[0]['id'],
        email: user[0]['email'],
        name: user[0]['name'],
        username: user[0]['username']
      )
    end
  end
end
