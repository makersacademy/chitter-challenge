require 'pg'
require 'bcrypt'

class Users
  attr_reader :id, :username, :email

  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.sign_up(username:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO users (username, email, password) VALUES('#{username}', '#{email}', '#{encrypted_password}') RETURNING id, username, email")
    Users.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.logged_in(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    return nil unless id
    result = connection.exec("SELECT * FROM users WHERE id = #{id};")
    Users.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.authenticate(username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM users WHERE username = '#{username}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password

    Users.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end
end
