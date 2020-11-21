require 'pg'

class User
  attr_reader :id, :username

  def initialize(id, username)
    @id = id
    @username = username
  end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    connection = PG.connect(dbname: 'chitter_test') if ENV['ENVIRONMENT'] == 'test'
    result = connection.exec('SELECT * FROM users')
    result.map { |u| User.new(u["id"], u["username"]) }
  end

  def self.create(username)
    connection = PG.connect(dbname: 'chitter')
    connection = PG.connect(dbname: 'chitter_test') if ENV['ENVIRONMENT'] == 'test'
    connection.exec("INSERT INTO users (username) VALUES('#{username}');")
    id = connection.exec("SELECT MAX(id) FROM users WHERE username = '#{username}';")[0]["max"]
    return User.new(id, username)
  end
end
