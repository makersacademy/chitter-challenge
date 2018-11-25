require 'bcrypt'

class User
  if ENV['ENVIRONMENT'] == 'test'
    @connection = PG.connect(dbname: 'chitter_chatter_test')
  else
    @connection = PG.connect(dbname: 'chitter_chatter')
  end

  attr_reader :id, :email, :name

  def initialize(id:, email:, name:)
    @id = id
    @email = email
    @name = name
  end

  def self.create(email:, password:, name:)
    encrypted_password = BCrypt::Password.create(password)

    # insert the encrypted password into the database, instead of the plaintext one
    result = @connection.exec("INSERT INTO users (name, email, password) VALUES('#{name}', '#{email}', '#{encrypted_password}') RETURNING id, email, name")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

  def self.find(id:)
    return nil unless id
    result = @connection.exec("SELECT * FROM users WHERE id = #{id}")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

  def self.authenticate(email:, password:)
    result = @connection.exec("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

end
