require 'bcrypt'

class User

  attr_reader :id, :email, :password, :name, :username

  def initialize(id, email, password, name, username)
    @id = id
    @email = email
    @password = password
    @name = name
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map { |hash| User.new(hash['id'], hash['email'], hash['password'], hash['name'], hash['username']) }
  end

  def self.create(options)
    password = BCrypt::Password.create(options[:password])
    result = DatabaseConnection.query("INSERT INTO users (email, password, name, username) VALUES('#{options[:email]}', '#{options[:password]}', '#{options[:name]}', '#{options[:username]}') RETURNING id, email, password, name, username;")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'], result[0]['username'])
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id.to_i}")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'], result[0]['name'], result[0]['username'])
  end

end
