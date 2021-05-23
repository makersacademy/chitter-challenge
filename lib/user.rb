require 'bcrypt'

class User
  attr_reader :id, :email, :display_name, :username
  def initialize(id:, email:, display_name:, username:)
    @id = id
    @email = email
    @display_name = display_name
    @username = username
  end

  def self.create(email:, password:, display_name:, username:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (email, password, display, handle) VALUES ($1, $2, $3, $4) RETURNING id, email, display, handle;",
      [email, encrypted_password, display_name, username]
    )
    User.new(id: result[0]['id'], email: result[0]['email'], display_name: result[0]['display'], username: result[0]['handle'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id=$1;", [id])
    User.new(id: result[0]['id'], email: result[0]['email'], display_name: result[0]['display'], username: result[0]['handle'])
  end

  def self.authenticate(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email=$1;", [email])
    return unless result.any?
    
    User.new(id: result[0]['id'], email: result[0]['email'], display_name: result[0]['display'], username: result[0]['handle'])
  end
end