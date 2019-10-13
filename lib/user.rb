require_relative 'database_connection'
require 'bcrypt'

class User
  def self.create(email:, user_name:, name:, password:)
    # encrypt the password
    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (email, user_name, name, password) VALUES('#{email}', '#{user_name}', '#{name}', '#{encrypted_password}') RETURNING id, email, user_name, name;")
    User.new(id: result[0]['id'], email: result[0]['email'], user_name: result[0]['user_name'], name: result[0]['name'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
    User.new(id: result[0]['id'], email: result[0]['email'], user_name: result[0]['user_name'], name: result[0]['name'])
  end

  attr_reader :id, :email, :user_name, :name

  def initialize(id:, email:, user_name:, name:)
    @id = id
    @email = email
    @user_name = user_name
    @name = name
  end

end
