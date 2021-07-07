require 'bcrypt'
# require_relative 'database_connection'

class User

  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{password}') RETURNING id, email;")
    User.new(
      id: result[0]['id'], 
      email: result[0]['email'],
      )
  end

  def self.find(id)
    return nil unless id
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
    )
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end
end