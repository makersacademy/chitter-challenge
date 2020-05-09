require 'pg'

class User

  attr_reader :name, :username, :password

  def initialize(name:, username:, password:)
    @name = name
    @username = username
    @password = password
  end

  def self.add(name:, username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    result = connection.exec("INSERT INTO users (name, username, password) VALUES
    ('#{name}', '#{username}', '#{password}') RETURNING name, username, password;")
    User.new(name: result[0]['name'], username: result[0]['username'],
      password: result[0]['password'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec('SELECT * FROM users;')
    result.map do |user|
      User.new(name: user['name'], username: user['username'], password: user['password'])
    end
  end

end
