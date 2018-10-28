require 'bcrypt'

class User
  attr_reader :id, :name, :username, :email

  def initialize(id: "1", name: 'anonymous', username: "", email: "")
    @id = id
    @name = name
    @username = username
    @email = email
  end

  def self.create(name:, username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO
      users (name, username, email, password)
      VALUES ('#{name}', '#{username}', '#{email}', '#{encrypted_password}')
      RETURNING id, name, username, email;
    ")

    User.new(id: result[0]['id'], name: result[0]['name'],
      username: result[0]['username'], email: result[0]['email']
    )
  end

  def self.username_in_db?(username)
    result = DatabaseConnection.query("SELECT * FROM users
      WHERE username = '#{username}';"
    )
    in_db?(result)
  end

  def self.email_in_db?(email)
    result = DatabaseConnection.query("SELECT * FROM users
      WHERE email = '#{email}';"
    )
    in_db?(result)
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users
      WHERE email = '#{email}'"
    )
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], name: result[0]['name'],
      username: result[0]['username'], email: result[0]['email']
    )
  end

  private_class_method
  def self.in_db?(result)
    array = result.map { |user| user }
    return false if array.empty?
    true
  end
end
