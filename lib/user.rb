require 'pg'
require_relative './peep'

class User

  attr_reader :id, :name, :email, :username, :password

  def initialize(id:, name:, email:, username:, password:)
   @id = id
   @name = name
   @email = email
   @username = username
   @password = password
  end

  def self.all
    setup_connection
    result = @@connection.exec("SELECT * FROM users")
    result.map do |user|
      User.new(id: user['id'], name: user['name'], email: user['email'], username: user['username'], password: user['password'])
    end
  end

  def self.create(name:, email:, username:, password:)
    setup_connection
    result = @@connection.exec("INSERT INTO users (name, email, username, password) VALUES ('#{name}', '#{email}', '#{username}', '#{password}') RETURNING id, name, email, username, password;")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  end

  def self.find(id:)
    setup_connection
    result = @@connection.exec("SELECT * FROM users WHERE id = #{id};")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  end

  def self.find_user(email:)
    setup_connection
    result = @@connection.exec("SELECT * FROM users WHERE email = '#{email}';")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  end

  def self.authenticate(email:, password:)
    setup_connection
    result = @@connection.exec("SELECT * FROM users WHERE email = '#{email}';")
    return unless result.any?
    return unless result[0]['password'] == password
    #return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  end

  def self.unique?(email:, username:)
    setup_connection
    result = @@connection.exec("SELECT * FROM users WHERE email = '#{email}';")
    return false if result.any?
    result = @@connection.exec("SELECT * FROM users WHERE username = '#{username}';")
    return false if result.any?
    return true
  end

  def peeps
    User.setup_connection
    @@connection.exec("SELECT * FROM peeps WHERE user_id = #{id};")
  end

  def self.setup_connection
    if ENV['ENVIRONMENT'] == 'test'
      @@connection = PG.connect(dbname: 'chitter_test')
    else
      @@connection = PG.connect(dbname: 'chitter')
    end
  end

end
