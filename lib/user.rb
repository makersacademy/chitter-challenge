require 'pg'
require 'uri'

class User 
  attr_reader :name, :username, :email, :id

  def initialize(name:, username:, id:, email:)
    @name = name
    @username = username
    @id = id
    @email = email
  end

  def self.create(name:, username:, email:, password:)
    connect = PG.connect(dbname: 'chitter_test')
    result = connect.exec("INSERT INTO users (name, username, email, password) VALUES ('#{name}', '#{username}', '#{email}', '#{password}') RETURNING name, username, id, email;")
    User.new(name: result[0]['name'], username: result[0]['username'], id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(username, password)
    return false unless is_username?(username)
    return false unless is_password?(password)
    connect = PG.connect(dbname: 'chitter_test')
    result = connect.exec("SELECT * FROM users WHERE username = '#{username}';")
    User.new(name: result[0]['name'], username: result[0]['username'], id: result[0]['id'], email: result[0]['email'])
  end

  def self.is_username?(username)
    connect = PG.connect(dbname: 'chitter_test')
    valid_username = connect.exec("SELECT COUNT(*) FROM users WHERE username = '#{username}';")
    valid_username[0]['count'] == "0" ? false : true
  end

  def self.is_password?(password)
    connect = PG.connect(dbname: 'chitter_test')
    valid_password = connect.exec("SELECT COUNT(*) FROM users WHERE password = '#{password}';")
    valid_password[0]['count'] == "0" ? false : true
  end

  def self.authenticate(username:, password:)
    connect = PG.connect(dbname: 'chitter_test')
    result = connect.exec("SELECT * FROM users WHERE username = '#{username}';")
    User.new(name: result[0]['name'], username: result[0]['username'], id: result[0]['id'], email: result[0]['email'])
  end

  def self.get_name(id)
    connect = PG.connect(dbname: 'chitter_test')
    result = connect.exec("SELECT * FROM users WHERE id = '#{id}';")
    User.new(name: result[0]['name'], username: result[0]['username'], id: result[0]['id'], email: result[0]['email'])
  end

  end