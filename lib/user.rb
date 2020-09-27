require 'pg'
require 'bcrypt'

class User

   attr_reader :id, :username

  def self.create(email:, password:, username:)
    set_environment
    encrypted_password = BCrypt::Password.create(password)
    result = @connection.exec("INSERT INTO users (email, password, username) VALUES('#{email}', '#{encrypted_password}', '#{username}') RETURNING id, username;")
    User.new(id: result[0]['id'], username: result[0]['username'])
  end 

  def self.find(id)
    set_environment
    return nil unless id
     result = @connection.exec("SELECT * FROM users WHERE id = '#{id}'")
     User.new(id: result[0]['id'], username: result[0]['username'])
  end
  
  def self.authenticate(email:, password:)
    set_environment
    result = @connection.exec("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

    def self.set_environment
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else 
      @connection = PG.connect(dbname: 'chitter')
    end 
  end 

  def initialize(id:, username:)
    @id = id
    @username = username
  end 

end 