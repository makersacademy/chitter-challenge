require 'bcrypt'

class Maker
  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

  def self.create(email:, password:, name:, username:)
    result =  DatabaseConnection.query("SELECT * FROM makers WHERE email = '#{email}' OR username = '#{username}';")
    return if result.any?

    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO makers (email, password, name, username)
    VALUES ('#{email}', '#{encrypted_password}', '#{name}', '#{username}')
    RETURNING id, email, name, username;")

    Maker.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name'],
      username: result[0]['username']
      )
  end

  def self.find(id:)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM makers WHERE id = #{id};")

    Maker.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name'],
      username: result[0]['username']
      )
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM makers WHERE email = '#{email}';")
    return nil unless result.any?

    return unless BCrypt::Password.new(result[0]['password']) == password

    Maker.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name'],
      username: result[0]['username']
      )
  end
end
