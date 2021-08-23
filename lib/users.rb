require 'database_connection'

class User
  def self.create(email:, password:, name:, username:)
    result = DatabaseConnection.query(
      "INSERT INTO handlers (email, password, name, username)
      VALUES($1, $2, $3, $4) RETURNING id, email, username, name;",
      [email, password, name, username]
    )
    User.new(id: result[0]['id'], email: result[0]['email'],
    name: result[0]['name'], username: result[0]['username'])
  end

  attr_reader :id, :email, :name, :username

  def initialize(id:, email:)
    @id = id
    @email = email
    @name = name 
    @username = username
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE id = $1",
      [id]
    )
    User.new(id: result[0]['id'], email: result[0]['email'],
    name: result[0]['name'], username: result[0]['username'])
  end
end