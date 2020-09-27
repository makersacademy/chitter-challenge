require 'bcrypt'

require_relative './user'

class UserService

  def self.register(username, name, email, password)
    @user = User.new(username, name, email)
    DatabaseConnection.query("INSERT INTO users (username, name, email, password)
        VALUES ('#{@user.username}', '#{@user.name}', '#{@user.email}', '#{BCrypt::Password.create(password)}');")
  end

  def self.login(username, password)
    result = DatabaseConnection.query("SELECT username, name, email, password FROM users WHERE username='#{username}'")
    return false unless result.count == 1

    user = result[0]
    return false unless BCrypt::Password.new(user["password"]) == password

    @user = User.new(user['username'], user['name'], user['email'])
  end

  def self.logout
    @user = nil
  end

  def self.current_user
    @user
  end
end