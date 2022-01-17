require 'bcrypt'
require 'pg'
require './docs/database_connection'

class User

  attr_reader :id, :email, :first_name, :surname, :password

  def initialize(id:, email:, first_name:, surname:, password:)
    @id = id
    @email = email
    @first_name = first_name
    @surname = surname
    @password = password
  end

  def self.create(email:, password:, first_name:, surname:)
    encrypted_password = BCrypt::Password.create(password)
    
    result = DatabaseConnection.query("INSERT INTO users (email, password, first_name, surname) VALUES('#{email}', '#{encrypted_password}', '#{first_name}', '#{surname}') RETURNING id, email, first_name, surname, password;")
    User.new(id: result[0]['id'], email: result[0]['email'], first_name: result[0]['first_name'], surname: result[0]['surname'], password: result[0]['password'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(id: result[0]['id'], email: result[0]['email'], first_name: result[0]['first_name'], surname: result[0]['surname'], password: result[0]['password'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], email: result[0]['email'], first_name: result[0]['first_name'], surname: result[0]['surname'])
  end

end

