require 'pg'
require_relative './database_connection'

class User
  def self.create(grip:, name:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users (grip, name, email, password) VALUES('#{grip}','#{name}','#{email}', '#{password}') RETURNING id, grip, name, email;")
    User.new(id: result[0]['id'], grip: result[0]['grip'], name: result[0]['name'], email: result[0]['email'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], grip: result[0]['grip'], name: result[0]['name'], email: result[0]['email'])
  end

  attr_reader :id, :grip, :name, :email

  def initialize(id:, grip:, name:, email:)
    @id = id
    @grip = grip
    @name = name
    @email = email
  end

end