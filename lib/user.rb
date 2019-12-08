require 'pg'
require 'BCrypt'

class User

  attr_reader :id, :email, :name, :username

  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

  def self.create(email:, password:, name:, username:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end

    encrypted_password = BCrypt::Password.create(password)

    result = connection.exec(
      "INSERT INTO users(email, password, name, username) 
      VALUES('#{email}', '#{encrypted_password}', '#{name}', '#{username}') 
      RETURNING id, email, name, username;"
      )
    User.new(
      id: result[0]['id'], email: result[0]['email'], 
      name: result[0]['name'], username: result[0]['username']
      )
  end

  def self.find(id:)
    return nil unless id

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    result = connection.exec("SELECT id, email, name, username FROM users WHERE id = '#{id}'")
    User.new(
      id: result[0]['id'], email: result[0]['email'], 
      name: result[0]['name'], username: result[0]['username']
      )
  end

end
