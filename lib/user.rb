require_relative 'database_connection'

class User

  attr_reader :username, :name, :email, :id

  def self.create(username, name, email, password)
    rs = DatabaseConnection.query("INSERT INTO users (username, name, email, password) VALUES ('#{username}', '#{name}', '#{email}', '#{password}') RETURNING id, username, name, email, password;")
    @active_user = User.new(rs[0]['id'], rs[0]['username'], rs[0]['name'], rs[0]['email'],rs[0]['password'])
  end

  def self.active
    @active_user
  end

  def self.log_out
    @active_user = nil
  end

  def self.log_in(username, password)
    rs = DatabaseConnection.query("SELECT id, username, name, email, password from users WHERE username = '#{username}' AND password = '#{password}';")
    @active_user = User.new(rs[0]['id'], rs[0]['username'], rs[0]['name'], rs[0]['email'],rs[0]['password']) unless rs.cmd_tuples == 0
  end

  def initialize(id, username, name, email, password)
    @id = id
    @username = username
    @name = name
    @email = email
    @password = password
  end

private
attr_reader :password


end
