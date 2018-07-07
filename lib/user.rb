require 'pg'

class User

  attr_reader :id, :name, :username

  def initialize(id, name, username)
    @id = id
    @name = name
    @username = username
  end

  def self.create(name, username, email, password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("INSERT INTO users (name, username, email, password) VALUES('#{name}','#{username}','#{email}','#{password}') RETURNING id, name, username")
    User.new(result.first['id'], result.first['name'], result.first['username'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['name'], user['username']) }
  end

end
