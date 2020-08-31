require 'bcrypt'

class User

  def initialize(id:, name:, handle:, email:)
    @id = id
    @name = name
    @handle = handle
    @email = email
  end

  attr_reader :id, :name, :handle, :email

  def self.create(name:, handle:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_manager_test'
    else
      connection = PG.connect :dbname => 'chitter_manager'
    end
    result = connection.exec "INSERT INTO users (name, handle, email, password) VALUES ('#{name}', '#{handle}', '#{email}', '#{encrypted_password}') RETURNING id, name, handle, email;"
    User.new(id: result[0]['id'], name: result[0]['name'], handle: result[0]['handle'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id

    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_manager_test'
    else
      connection = PG.connect :dbname => 'chitter_manager'
    end
    result = connection.exec "SELECT * FROM users WHERE id = '#{id}'"
    User.new(id: result[0]['id'], name: result[0]['name'], handle: result[0]['handle'], email: result[0]['email'])
  end
end
