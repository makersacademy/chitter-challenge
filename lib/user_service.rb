require 'bcrypt'

require_relative './user'

class UserService

  def self.register(username, name, email, password)
    @user = User.new(username, name, email)
    DatabaseConnection.query("INSERT INTO users (username, name, email, password)
        VALUES ('#{@user.username}', '#{@user.name}', '#{@user.email}', '#{BCrypt::Password.create(password)}');")
  end

  def self.login(username, password)
    user = get_user(username)
    return false if user == false
    return false unless password_match?(user, password)
    @user = User.new(user['username'], user['name'], user['email'])
  end

  def self.logout
    @user = nil
  end

  def self.current_user
    @user
  end

  private

  def self.get_user(username)
    result = DatabaseConnection.query("SELECT * FROM users WHERE username='#{username}'")
    false unless result.count == 1
    result[0]
  end

  def self.password_match?(user, password)
    BCrypt::Password.new(user['password']) == password
  end
end