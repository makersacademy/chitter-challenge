require 'pg'

class User

  attr_reader :name, :username, :password

  def initialize(name:, username:, password:)
    @name = name
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

  def self.add(name:, username:, password:)
    self.connection
    result = connection.exec("INSERT INTO users (name, username, password) VALUES
    ('#{name}', '#{username}', '#{password}') RETURNING name, username, password;")
    User.new(name: result[0]['name'], username: result[0]['username'],
      password: result[0]['password'])
  end

  def self.all
    self.connection
    result = connection.exec('SELECT * FROM users;')
    result.map do |user|
      User.new(name: user['name'], username: user['username'], password: user['password'])
    end
  end

  def self.check(username:, password:)
    self.connection
    result = connection.exec("SELECT EXISTS(SELECT * FROM users WHERE username = '#{username}' AND password = '#{password}');")
    return false if result.getvalue(0,0) == "f"
    result.getvalue(0,0) == "t"
  end
end
