require 'pg'

class User
  attr_accessor :id, :username, :password
  def initialize(id:, username:, password:)
    @id = id
    @username = username
    @password = password
  end

  def self.connection
    ENV['ENVIRONMENT'] == 'test' ? @conn = PG.connect(dbname: 'chitter_test') : @conn = PG.connect(dbname: 'chitter')
  end

  def self.create(username:, password:)
    connection
    result = @conn.exec("INSERT INTO users (id, username, password) VALUES(DEFAULT, '#{username}', '#{password}') RETURNING id, username, password;")
    User.new(id: result[0]["id"], username: result[0]["username"], password: result[0]["password"])
  end

  def self.find(id:)
    connection
    result = @conn.exec("SELECT * FROM users WHERE id = #{id};")
    user = User.new(id: result[0]["id"], username: result[0]["username"], password: result[0]["password"])
    return user
  end
end
