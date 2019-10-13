require 'bcrypt'

class User

  attr_reader :id, :username, :email, :name

  def initialize(id:, username:, email:, name:)
    @id = id
    @username = username
    @email = email
    @name = name
  end

  def self.create(username:, password:, email:, name:)
    # ecrypt password
    encrypted_password = BCrypt::Password.create(password)

    # insert encrypted password into DB, instead of plaintext pne
    result = DatabaseConnection.query("INSERT INTO users (username, password, email, name)
    VALUES('#{username}', '#{encrypted_password}', '#{email}', '#{name}')
    RETURNING id, username, email, name;")
    User.new(id: result[0]['id'], username: result[0]['username'],
       email: result[0]['email'], name: result[0]['name'])
  end

  def self.find(id)
    return nil unless id

    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], username: result[0]['username'],
      email: result[0]['email'], name: result[0]['name'])
  end
end
