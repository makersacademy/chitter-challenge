require_relative './database_connection'
require 'bcrypt'
require_relative './peep.rb'

class Maker

  def self.create(email:, password:, name:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO makers (email, password, name) VALUES('#{email}', '#{encrypted_password}', '#{name}') RETURNING id, email, name;")

    Maker.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name']
    )
  end

  def self.find(id:)

    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM makers WHERE id = #{id}")
    Maker.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name']
    )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM makers WHERE email = '#{email}'")
    return unless result.any?

    Maker.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name']
    )
  end

  attr_reader :id, :email, :name

  def initialize(id:, email:, name:)
    @id = id
    @email = email
    @name = name
  end
end
