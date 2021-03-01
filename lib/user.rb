require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :email
  include BCrypt

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    encrypted_password = BCrypt::Password.create(password)
    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM users WHERE id=#{id}")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def initialize(id:, email:)
    @id = id
    @email = email
  end

end
