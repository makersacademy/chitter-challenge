require "pg"
require 'bcrypt'

class User

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = connect_to_db.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = connect_to_db.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = connect_to_db.exec("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.connect_to_db
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "message_manager_test")
    else
      connection = PG.connect(dbname: "message_manager")
    end
  end
end