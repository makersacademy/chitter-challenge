require_relative './database_connection.rb'

class User
  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, password:, name:, username:)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.sign_up(email:, password:, name:, username:)
    sql = "INSERT INTO users (email, password, name, username)
           VALUES('#{email}', '#{password}', '#{name}', '#{username}')
           RETURNING *;"

    user = DatabaseConnection.query(sql).first

    User.new(id: user['id'], email: user['email'], password: user['password'],
             name: user['name'], username: user['username'])
  end

  def self.unique_email?(email)
    sql = "SELECT email FROM users WHERE email = '#{email}';"
    result = DatabaseConnection.query(sql)
    result.count.zero?
  end

  def self.unique_username?(username)
    sql = "SELECT username FROM users WHERE username = '#{username}';"
    result = DatabaseConnection.query(sql)
    result.count.zero?
  end

  def self.authenticate(email:, password:)
    sql = "SELECT * FROM users WHERE email = '#{email}';"
    result = DatabaseConnection.query(sql).first
    return if (result.nil? || password != result['password'])

    User.new(id: result['id'], email: result['email'],
             password: result['password'], name: result['name'],
             username: result['username'])
  end
end
