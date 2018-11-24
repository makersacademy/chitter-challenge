require 'pg'

class Users
  if ENV['ENVIRONMENT'] == 'test'
    @connection = PG.connect(dbname: 'chitter_test')
  else
    @connection = PG.connect(dbname: 'chitter')
  end

  attr_reader :username, :email, :password, :name

  def initialize(id:, username:, email:, password:, name:)
    @id  = id
    @username = username
    @email = email
    @password = password
    @name = name
  end


  def self.create(username:, email:, password:, name:)
    result = @connection.exec("INSERT INTO users (username, email, password, name) VALUES('#{username}', '#{email}', '#{password}', '#{name}') RETURNING id, username, email, password, name;")
    Users.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'],password: result[0]['password'], name: result[0]['name'])
  end




end
