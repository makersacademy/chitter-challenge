require 'bcrypt'

class User

  attr_accessor :name, :email, :id, :password

  def initialize(name, email, id, password)
    @name = name
    @email = email
    @id = id
    @password = password
  end

  def self.all
    @users = []
    DBConnection.connection.exec("SELECT * FROM users").map do |user|
      @users << User.new(user['name'], user['email'], user['id'], user['password'])
    end
    return @users
  end

  def self.create(name, email, password)
    encrypted_password = BCrypt::Password.create(password)
    DBConnection.connection.exec("INSERT INTO users (name, email, password) VALUES ('#{name}', '#{email}', '#{encrypted_password}');")
  end

  def self.find_id_by_email(email)
    return nil unless email
    DBConnection.connection.exec("SELECT id FROM users WHERE email = '#{email}'")
  end

  def self.find_name_by_id(id)
    return nil unless id
    DBConnection.connection.exec("SELECT name FROM users WHERE id = '#{id}'")
  end

  def self.authenticate(email, password)
    encrypted_password = BCrypt::Password.create(password)
    DBConnection.query("SELECT * FROM users WHERE email = '#{email}'")
  end
end
