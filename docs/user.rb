require 'bcrypt'
require 'pg'
require './docs/database_connection'

class User

  attr_reader :id, :first_name, :surname, :email, :password

  def initialize(id:, first_name:, surname:, email:, password:)
    @id = id
    @first_name = first_name
    @surname = surname
    @email = email
    @password = password
  end

  def self.create(first_name:, surname:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    
    result = DatabaseConnection.query("INSERT INTO users (first_name, surname, email, password) VALUES('#{first_name}', '#{surname}', '#{email}', '#{encrypted_password}') RETURNING id, first_name, surname, email, password;")
    User.new(id: result[0]['id'], first_name: result[0]['first_name'], surname: result[0]['surname'], email: result[0]['email'], password: result[0]['password'])
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
    User.new(id: result[0]['id'], first_name: result[0]['first_name'], surname: result[0]['surname'], email: result[0]['email'], password: result[0]['password'])
  end

end

