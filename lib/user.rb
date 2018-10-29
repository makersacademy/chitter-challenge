require 'bcrypt'

class User

  attr_reader :id, :name, :email, :password

  def initialize(id:, name:, email:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end

  def self.create(name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (user_name, user_email, user_password) VALUES('#{name}', '#{email}', '#{encrypted_password}') RETURNING id, user_name, user_email, user_password")
    User.new(id: result[0]['id'], name: result[0]['user_name'], email: result[0]['user_email'], password: result[0]['user_password'])
  end
end
