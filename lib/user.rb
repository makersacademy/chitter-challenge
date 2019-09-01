require 'bcrypt'

class User
  attr_reader :id, :name, :email

  def initialize(id:, name:, email:)
    @id = id,
    @name = name,
    @email = email
  end

  def self.create(name:, email:, password:)
    # database_connection_setup
    encrypted_password = BCrypt::Password.create(password)
    sql = "INSERT INTO users (name, email, password) VALUES('#{name}', '#{email}', '#{encrypted_password}') RETURNING id, name, email;"
    result = DatabaseConnection.query(sql)
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    # database_connection_setup
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
  end

  # def self.connect_database
  #   if ENV['RACK_ENV'] == 'test'
  #     DatabaseConnection.setup('chitter_test')
  #   else
  #     DatabaseConnection.setup('chitter')
  #   end
  # end
  #
  # private_class_method :connect_database
end
