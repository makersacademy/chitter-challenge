require_relative 'database_connection'

class User
  attr_reader :id, :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(email:, password:, name:, username:)
    return false unless email?(email)

    result = DatabaseConnection.query(
      "INSERT INTO users(email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}') RETURNING id, email, password, name, username;")
    User.new(
      id: result[0]['id'], 
      email: result[0]['username'], 
      password: result[0]['password'], 
      name: result[0]['name'], 
      username: result[0]['username']
    )
  end

  def self.email?(email)
    email =~ /\A#{URI::MailTo::EMAIL_REGEXP}\z/
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM users')
    result.map do |user|
      User.new(
        id: user['id'],
        name: user['name'],
        username: user['username'],
        email: user['email'],
        password: user['password']
      )
    end
  end
end
