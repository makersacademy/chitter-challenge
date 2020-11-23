require 'pg'

class User
  attr_reader :username, :id

  def initialize(id, username)
    @username = username
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    results = connection.exec('SELECT * FROM chitter;')
    results.map { |u| User.new(u["id"], u["username"]) }
  end

  def self.create(username)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO chitter (username) VALUES ('#{username}');")
  end

  def self.username_by_id(id)
    connection = PG.connect(dbname: 'chitter')
    connection = PG.connect(dbname: 'chitter_test') if ENV['ENVIRONMENT'] == 'test'
    connection.exec("SELECT username FROM chitter WHERE id = #{id};")[0]["username"]
  end
end
