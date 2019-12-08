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
    result =  DatabaseConnection.query("SELECT * FROM makers WHERE email = '#{email}';")
    return if result.any?
    
    encrypted_password = BCrypt::Password.create(password)
    sql = "INSERT INTO makers (email, password, name, username)
           VALUES ('#{email}', '#{encrypted_password}', '#{name}', '#{username}')
           RETURNING id, email, name, username;"
    result = DatabaseConnection.query(sql)
    Maker.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name'],
      username: result[0]['username']
      )
  end

  def self.find(id:)
    return nil unless id

    sql = "SELECT * FROM makers WHERE id = #{id};"
    result = DatabaseConnection.query(sql)
    Maker.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name'],
      username: result[0]['username']
      )
  end
end
