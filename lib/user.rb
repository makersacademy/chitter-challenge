require 'bcrypt'

class User
  def self.create(email:, password:, name:, user_name:)

    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
      "INSERT INTO users (email, password, name, user_name) VALUES($1, $2, $3, $4) RETURNING id, email, name, user_name;",[email, encrypted_password, name, user_name]
    )
    result.map do |user|
      User.new(id: user['id'], email: user['email'], name: user['name'], user_name: user['user_name'])
    end.first
  end

  def self.find_by_id(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}") 
    result.map do |user|
      User.new(id: user['id'], email: user['email'], name: user['name'], user_name: user['user_name'])
    end.first
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = $1", [email]
    )

    return unless result.any?
    return unless BCrypt::Password.new(result.map{ |user| user['password'] }.first) == password

    result.map do |user|
      User.new(id: user['id'], email: user['email'], name: user['name'], user_name: user['user_name'])
    end.first

  end

  attr_reader :id, :email, :name, :user_name

  def initialize(id:, email:, name:, user_name:)
    @id = id
    @email = email
    @name = name
    @user_name = user_name
  end
end
