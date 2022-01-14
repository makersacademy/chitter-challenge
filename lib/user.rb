require 'pg'
require_relative 'database_connection'
require 'bcrypt'

class User

  attr_reader :id, :username, :email, :first_name, :last_name, :password

  def initialize(id:, username:, email:, first_name:, last_name:, password:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @username = username
    @email = email
    @password = password
  end

  def self.create(first_name:, last_name:, username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
      "INSERT INTO users(first_name, last_name, username, email, password)
      VALUES($1, $2, $3, $4, $5) RETURNING *;",
      [first_name.capitalize, last_name.capitalize, username, email, encrypted_password]
    )
  
    User.new(id: result[0]['id'], first_name: result[0]['first_name'], 
    last_name: result[0]['last_name'], username: result[0]['username'],
    email: result[0]['email'], password: result[0]['password'])
  end

  def self.find(id:)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE id = $1;", [id]
    )
    return unless result.any?

    User.new(id: result[0]['id'], first_name: result[0]['first_name'], 
    last_name: result[0]['last_name'], username: result[0]['username'],
    email: result[0]['email'], password: result[0]['password'])
  end

  def self.account(email:)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = $1;", [email]
    )
    return unless result.any?

    User.new(id: result[0]['id'], first_name: result[0]['first_name'], 
    last_name: result[0]['last_name'], username: result[0]['username'],
    email: result[0]['email'], password: result[0]['password'])
  end

  def self.valid_password?(id:, password:)
    user = User.find(id: id)
    stored_password = BCrypt::Password.new(user.password)
    stored_password == password
  end

  def self.unique?(username:, email:)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE username = $1 OR email = $2;", [username, email]
    )
    result.none?
    # if the PG result has no data, the account is unique
  end
end
