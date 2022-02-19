require 'bcrypt'

class User
  def self.create(email:, password:, name:, user_name:)
    return nil if email.empty? || password.empty? || name.empty? || user_name.empty?
    escaped_user_name = DatabaseConnection.escape_string(user_name)
    return nil if email_or_username_exists?(email, escaped_user_name)

    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
      "INSERT INTO users (email, password, name, user_name) VALUES($1, $2, $3, $4) RETURNING user_id, email, name, user_name;",[
        email, encrypted_password, name, escaped_user_name]
    )
    result.map do |user|
      User.new(id: user['user_id'], email: user['email'], name: user['name'], 
user_name: user['user_name'])
    end.first
  end

  def self.find_by_id(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE user_id = #{id}") 
    result.map do |user|
      User.new(id: user['user_id'], email: user['email'], name: user['name'], 
user_name: user['user_name'])
    end.first
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = $1", [email]
    )

    return unless result.any?
    return unless BCrypt::Password.new(result.map { |user| user['password'] }.first) == password

    result.map do |user|
      User.new(id: user['user_id'], email: user['email'], name: user['name'], 
user_name: user['user_name'])
    end.first

  end

  attr_reader :id, :email, :name, :user_name

  def initialize(id:, email:, name:, user_name:)
    @id = id
    @email = email
    @name = name
    @user_name = user_name
  end

  def self.email_or_username_exists?(email, user_name)
    DatabaseConnection.query(
      "SELECT * FROM users WHERE email = $1 OR user_name = $2",[email, user_name]
    ).any?
  end

end
