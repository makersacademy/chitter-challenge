require 'pg'
require 'bcrypt'

class User

  attr_reader :username, :id, :email

  def initialize(username:, id:, email:)
    @username = username
    @id = id
    @email = email
  end

  def self.create(username:, email: , password: )
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    # encrypt the plantext password
    encrypted_password = BCrypt::Password.create(password)

    result = connection.exec("INSERT INTO users (username, email, password) VALUES ('#{username}', '#{email}', '#{encrypted_password}') RETURNING id, username, email;")
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM users WHERE id = #{id};")
    User.new(id: result[0]['id'], email: result[0]['email'], username: result[0]['username'])
  end
end