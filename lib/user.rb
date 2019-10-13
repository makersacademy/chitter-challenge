require 'bcrypt'

class User

  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end

  def self.create(username:, password:)
    # ecrypt password
    encrypted_password = BCrypt::Password.create(password)

    # insert encrypted password into DB, instead of plaintext pne
    result = DatabaseConnection.query("INSERT INTO users (username, password)
    VALUES('#{username}', '#{encrypted_password}')
    RETURNING id, username;")
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], username: result[0]['username'])
end

end
