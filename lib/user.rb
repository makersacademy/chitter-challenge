require 'pg'

class User
  attr_reader :username, :password

  def initialize(username:, password:)
    @username = username
    @password = password
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'users_manager_test')
    else
      connection = PG.connect(dbname: 'users_manager')
    end
    result = connection.exec('SELECT * FROM users')
    result.map do |user|
      User.new(username: user['username'], password: user['password'])
    end
  end

  def self.create(username:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'users_manager_test')
    else
      connection = PG.connect(dbname: 'users_manager')
    end
    result = connection.exec("INSERT INTO users (username, password) VALUES('#{username}','#{password}') RETURNING username, password")
    User.new(username: result[0]['username'], password: result[0]['password'])
  end

end
