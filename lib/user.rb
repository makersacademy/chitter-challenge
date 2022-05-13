require 'pg'
require 'bcrypt'

class User

  attr_reader :id, :user_name
  
  def initialize(id:, user_name:)
    @id = id
    @user_name = user_name
  end

  def self.create(user_name:, password:, email:)
    encrypted_password = BCrypt::Password.create(password)
    # encrypted password is working, but I can't 'unsalt' it back!
    connection = pg_connection
    user = connection.exec("INSERT INTO users (user_name, password, email) VALUES($1, $2, $3) RETURNING id, user_name;", 
      [user_name, password, email])
    User.new(id: user[0]['id'], user_name: user[0]['user_name'])
  end
    
  def self.find(id:)
    return nil unless id
    connection = pg_connection
    user = connection.exec("SELECT * FROM users WHERE id = $1", [id])
    User.new(id: user[0]['id'], user_name: user[0]['user_name'])
  end
  
  def self.login_find(user_name:, password:)
    encrypted_password = BCrypt::Password.create(password)
    # encrypted password is working, but I can't 'unsalt' it back!
    connection = pg_connection
    user = connection.exec(
      "SELECT * FROM users WHERE user_name = $1 AND password = $2",
      [user_name, password]
    )
    User.new(id: user[0]['id'], user_name: user[0]['user_name'])
  end

  def self.pg_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end
end
