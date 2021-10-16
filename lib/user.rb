require 'pg'
require 'bcrypt'

class User

  attr_reader :id, :username, :email, :first_name, :last_name, :password

  def initialize(id:, username:, email:, first_name:, last_name:, password:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @username = username
    @email = email
    @password = password
  end

  def self.create(first_name:, last_name:, username:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    encrypted_password = BCrypt::Password.create(password)
    result = connection.exec_params(
      "INSERT INTO users(first_name, last_name, username, email, password)
      VALUES($1, $2, $3, $4, $5) RETURNING *;",
      [first_name, last_name, username, email, encrypted_password]
    )
  
    User.new(id: result[0]['id'], first_name: result[0]['first_name'], 
    last_name: result[0]['last_name'], username: result[0]['username'],
    email: result[0]['email'], password: result[0]['password'])
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

    User.new(id: result[0]['id'], first_name: result[0]['first_name'], 
    last_name: result[0]['last_name'], username: result[0]['username'],
    email: result[0]['email'], password: result[0]['password'])
  end
end
