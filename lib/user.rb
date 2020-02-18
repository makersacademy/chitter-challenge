require 'bcrypt'

class User

  attr_reader :id, :name, :email, :username
  
  def initialize(id:, name:, email:, username:)
    @id = id
    @name = name
    @email = email
    @username = username
  end

  def self.create(name:, email:, password:, username:)
    encrypted_password = encrypt password
    connection = DataBase.new.connection
    result = connection.exec("INSERT INTO users (name, username, email, password) VALUES ('#{name}', '#{username}', '#{email}', '#{encrypted_password}') RETURNING id, username, name, email")
    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.find(id)
    return nil unless id
    connection = DataBase.new.connection
    result = connection.exec <<~SQL
      SELECT * 
        FROM users 
        WHERE id='#{id}';
    SQL

    User.new(id: result[0]['id'],
             name: result[0]['name'],
             username: result[0]['username'],
             email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    connection = DataBase.new.connection
    
    result = connection.exec("SELECT * FROM users WHERE email='#{email}';")
    
    return unless result.any?
    
    return unless decrypt(result[0]['password']) == password

    User.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.encrypt(password)
    BCrypt::Password.create(password)
  end

  def self.decrypt(password)
    BCrypt::Password.new(password)
  end
end
