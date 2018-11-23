class User

  attr_reader :user_id, :handle, :display_name, :email, :password

  def initialize(user_id:, handle:, display_name:, email:, password:)
    @user_id = user_id
    @handle = handle
    @display_name = display_name
    @email = email
    @password = password
  end

  def self.create(handle, display_name, email, password)
    hashed_password = BCrypt::Password.create(password)
    DatabaseConnection.query("INSERT INTO users (handle, display_name, email, password) VALUES ('#{handle}', '#{display_name}', '#{email}', '#{hashed_password}')")
  end

  def self.retrieve(user_id:)
    user = DatabaseConnection.query("SELECT * FROM users WHERE user_id = '#{user_id}'").first
    User.new(
      user_id: user['user_id'],
      handle: user['handle'],
      display_name: user['display_name'],
      email: user['email'],
      password: user['password']
    )
  end
end
