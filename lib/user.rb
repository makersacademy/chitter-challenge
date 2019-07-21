require 'pg'
require 'bcrypt'

class User
  def self.create(email:, password:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "peeps_manager_test")
    else
      connection = PG.connect(dbname: "peeps_manager")
    end
    encrypted_password = BCrypt::Password.create(password)

    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "peeps_manager_test")
    else
      connection = PG.connect(dbname: "peeps_manager")
    end
    result = connection.exec("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'],email: result[0]['email'])
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end
end
