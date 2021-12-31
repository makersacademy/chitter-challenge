require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :username, :email, :password

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end
  
  def self.create(username:, email:, password:)
    # encrypt the plantext password
    encrypted_password = BCrypt::Password.create(password)
    
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end  

    result = connection.exec_params("INSERT INTO users (username, email, password) VALUES($1, $2, $3) RETURNING id, username, email, password;", [username, email, encrypted_password])
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.find(id:)
    return nil unless id
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end  

    result = connection.exec_params("SELECT * FROM users WHERE id = $1", [id])
    User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.authenticate(email:, password:)
  
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end  
   
    result = connection.exec("SELECT * FROM users WHERE email = $1", [email])
    return unless result.any?
    # return unless result[0]['password'] == password
    User.new(email: result[0]['email'], username: result[0]['username'], id: result[0]['id'], password: result[0]['password'])
  end

end