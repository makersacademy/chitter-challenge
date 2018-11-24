require 'pg'
require_relative 'database_connection'

class User
  attr_reader :id, :name, :user_name, :email, :password

  def initialize(id:, name:, user_name:, email:, password:)
    @id = id
    @name = name
    @user_name = user_name
    @email = email
    @password = password
  end

  def self.register(name:, user_name:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (name, user_name, \
      email, password) VALUES ('#{name}', '#{user_name}', '#{email}', \
        '#{password}') RETURNING id, name, user_name, email, password;")
    User.new(id: result[0]['id'], name: result[0]['name'], \
      user_name: result[0]['user_name'], email: result[0]['email'], \
      password: result[0]['password'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = id")
    User.new(id: result[0]['id'], name: result[0]['name'], \
      user_name: result[0]['user_name'], email: result[0]['email'], \
      password: result[0]['password'])
  end
end
