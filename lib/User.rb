require 'bcrypt'

class User

  attr_reader :user_id, :handle, :display_name, :email

  def initialize(user_id:, handle:, display_name:, email:)
    @user_id = user_id
    @handle = handle
    @display_name = display_name
    @email = email
  end

  def self.create(handle:, display_name:, email:, password:)
    hashed_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (handle, display_name, email, password) VALUES ('#{handle}', '#{display_name}', '#{email}', '#{hashed_password}') RETURNING user_id, handle, display_name, email").first
    User.new(
      user_id: user['user_id'],
      handle: user['handle'],
      display_name: user['display_name'],
      email: user['email']
    )
  end

  def self.lookup(handle)
    result = DatabaseConnection.query("SELECT user_id FROM users WHERE handle = '#{handle}'")
    result.first['user_id']
  end

  def self.retrieve(user_id:)
    return nil unless user_id
    user = DatabaseConnection.query("SELECT * FROM users WHERE user_id = '#{user_id}'").first
    User.new(
      user_id: user['user_id'],
      handle: user['handle'],
      display_name: user['display_name'],
      email: user['email']
    )
  end

  def self.authenticate(handle:, password:)
    user = DatabaseConnection.query("SELECT * FROM users WHERE handle = '#{handle}'").first
    p user
    return unless user.any?
    return unless BCrypt::Password.new(user['password']) == password
    User.new(
      user_id: user['user_id'],
      handle: user['handle'],
      display_name: user['display_name'],
      email: user['email']
    )
  end

end
