require_relative 'database_connection'

class User
  USERNAME_ALREADY_IN_USE = 'used username'
  EMAIL_ALREADY_IN_USE = 'used email'
  attr_reader :id, :name, :username, :email
  def initialize(id:, name:, username:, email:)
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name:, username:, email:, password:)
    return USERNAME_ALREADY_IN_USE unless
      User.find(column: "username", value: username).nil?
    return EMAIL_ALREADY_IN_USE unless
      User.find(column: "email", value: email).nil?
    result = DatabaseConnection.query(
      "INSERT INTO users (name, username, email, password) "\
      "VALUES('#{name}', '#{username}','#{email}', '#{password}') "\
      "RETURNING id, name, username, email, password;").first
    User.new(id: result['id'], name: result['name'], 
      username: result['username'], email: result['email'])
  end

  def self.find(column:, value:)
    return nil if column.nil?
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE #{column} = '#{value}'").first
    return nil if result.nil?
    User.new(
      id: result['id'],
      name: result['name'],
      username: result['username'],
      email: result['email']
    )
  end
end
