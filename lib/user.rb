require 'pg'
require 'bcrypt'

class User
  def self.create(username:, password:)

    encrypted_password = BCrypt::Password.create(password)

    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO Username (username, password) VALUES($1, $2) RETURNING id, username;", [username, encrypted_password])
    User.new(id: result[0]['id'], username: result[0]['username'])

  end

  attr_reader :id, :username

  def initialize(id:, username:)
    @id = id
    @username = username
  end

  def self.find(id)
    return nil unless id

    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("SELECT * FROM Username WHERE id = $1", [id])
    User.new(id: result[0]['id'], username: result[0]['username'])
  end


  def self.authenticate(username, password)

    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("SELECT * FROM Username WHERE username = $1", [username])

    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    
    User.new(id: result[0]['id'], username: result[0]['username'])
  end

end