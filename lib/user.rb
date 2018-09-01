# user.rb
class User

  attr_reader :username, :id

  def initialize(id, username)
    @id = id
    @username = username
  end

  def self.signup(params)
    name = params['name']
    email = params['email']
    password = params['password']
    username = params['username']
    sqlquery = "INSERT INTO users(name, email, password, username) VALUES('#{name}', '#{email}', '#{password}', '#{username}') RETURNING id, username;"
    result = DatabaseConnection.query(sqlquery)
    @current_user = User.new(result[0]['id'], result[0]['username'])
  end

  def self.login(params)
    email = params['email']
    password = params['password']
    sqlquery = "SELECT username FROM users WHERE email='#{email}' AND password='#{password}';"
    result = DatabaseConnection.query(sqlquery)
    @current_user = User.new(result[0]['id'], result[0]['username'])
  end

  def self.current_user
    @current_user
  end

end
