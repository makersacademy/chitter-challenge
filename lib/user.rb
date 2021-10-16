require 'pg'
require 'bcrypt'

class User

  attr_reader :id, :username, :email, :name, :password

  def initialize(id:, username:, email:, name:, password:)
    @id = id
    @name = name
    @username = username # must be unique
    @email = email # must be unique
    @password = password # need to encrypt
  end

  def self.create(name:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    encrypted_password = BCrypt::Password.create(password)
    result = connection.exec_params(
      "INSERT INTO users(name, username, email, password)
      VALUES($1, $2, $3, $4) RETURNING id, name, username, email, password;",
      [name, username, email, encrypted_password]
    )
  
    User.new(id: result[0]['id'], name: result[0]['name'],
    username: result[0]['username'], email: result[0]['email'], 
    password: result[0]['password'])
  end

  def self.find(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params(
      "SELECT * FROM users WHERE id = $1;", [id]
    )

    User.new(id: result[0]['id'], name: result[0]['name'],
    username: result[0]['username'], email: result[0]['email'], 
    password: result[0]['password'])
  end
end
