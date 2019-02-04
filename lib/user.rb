# require 'bcrypt'
require 'pg'

#require 'database_connection'

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
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM users;")
    users = result.map do |user|
      User.new(
        id: user['id'],
        name: user['name'],
        username: user['username'],
        email: user['email'],
        password: user['password']
      )
    end
  end

  def self.create(name:, email:, username:, password:)
    #result = DatabaseConnection.query("INSERT INTO users (name, email, username, password) VALUES ('#{name}', '#{email}', '#{username}', '#{password}') RETURNING id, name, email, username, password;")
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    # encrypted_password = BCrypt::Password.create(password)
    # result = connection.exec("INSERT INTO users (name, email, username, password) VALUES ('#{name}', '#{email}', '#{username}', '#{encrypted_password}') RETURNING id, name, email, username, password;")
    result = connection.exec("INSERT INTO users (name, email, username, password) VALUES ('#{name}', '#{email}', '#{username}', '#{password}') RETURNING id, name, email, username, password;")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  end

  def self.find(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
     result = connection.exec("SELECT * FROM users WHERE id = '#{id}';")
     User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  end

  def self.authenticate(username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
     # result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
     result = connection.exec("SELECT * FROM users WHERE username = '#{username}';")
     return unless result.any?
     return unless result[0]['password'] == password

     User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])

  end

end
