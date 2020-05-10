require 'pg'

class User

  attr_reader :name, :email, :username, :password

  def initialize(name:, email:, username:, password:)
    @name = name
    @email = email
    @username = username
    @password = password
  end

  def self.connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
  end

  def self.add(name:, email:, username:, password:)
    connection
    result = connection.exec("INSERT INTO users (name, email, username, password)
     VALUES ('#{name}', '#{email}', '#{username}', '#{password}')
      RETURNING name, email, username, password;")
    User.new(name: result[0]['name'], username: result[0]['username'],
      email: result[0]['email'], password: result[0]['password'])
  end

  def self.all
    connection
    result = connection.exec('SELECT * FROM users;')
    result.map do |user|
      User.new(name: user['name'], email: user['email'],
        username: user['username'], password: user['password'])
    end
  end

  def self.authenticate(username:, password:)
    connection
    result = connection.exec("SELECT EXISTS(SELECT * FROM users WHERE
      username = '#{username}' AND password = '#{password}');")
    result.getvalue(0, 0) == "t"
  end

  def self.get(username:)
    result = connection.exec("SELECT * FROM users WHERE username = '#{username}';")
    User.new(name: result[0]['name'], email: result[0]['email'],
      username: result[0]['username'], password: result[0]['password'])
  end
end
