require './database_connection'

class User

  def self.create(email:, password:, name:, username:)
    encrypted_password = BCrypt::Password.create(password)
    sql = "INSERT INTO users (email, password, name, username) "
    sql += "VALUES('#{email}', '#{encrypted_password}', '#{name}', '#{username}') "
    sql += "RETURNING id, email, name, username;"
    result = DBConnection.query(sql)

    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name'],
      username: result[0]['username']
    )
  end

  def self.authenticate(email:, password:)
    sql = "SELECT * FROM users WHERE email = '#{email}';"
    result = DBConnection.query(sql)
    return nil unless result.any?
    return nil unless BCrypt::Password.new(result[0]['password']) == password

    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name'],
      username: result[0]['username']
    )
  end

  def self.find(id)
    sql = "SELECT * FROM users WHERE id = '#{id}';"
    result = DBConnection.query(sql)

    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      name: result[0]['name'],
      username: result[0]['username']
    )
  end

  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

end
