require 'pg'

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
    setup_connection
    result = @@connection.exec("SELECT * FROM users")
    result.map do |user|
      User.new(id: user['id'], name: user['name'], email: user['email'], username: user['username'], password: user['password'])
    end
  end

  def self.create(name:, email:, username:, password:)
    setup_connection
    result = @@connection.exec("INSERT INTO users (name, email, username, password) VALUES ('#{name}', '#{email}', '#{username}', '#{password}') RETURNING id, name, email, username, password;")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  end

  def self.find(id:)
    setup_connection
    result = @@connection.exec("SELECT * FROM users WHERE id = #{id};")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], username: result[0]['username'], password: result[0]['password'])
  end

  def self.setup_connection
    if ENV['ENVIRONMENT'] == 'test'
      @@connection = PG.connect(dbname: 'chitter_test')
    else
      @@connection = PG.connect(dbname: 'chitter')
    end
  end

end
