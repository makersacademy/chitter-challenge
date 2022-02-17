require 'bcrypt'

class User
  def self.create(email:, password:)

    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query(
      "INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email;",[email, 
encrypted_password]
    )
    result.map do |user|
      User.new(id: user['id'], email: user['email'])
    end.first
  end

  def self.find_by_id(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}") 
    result.map do |user|
      User.new(id: user['id'], email: user['email'])
    end.first
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end
end
