class User
  require_relative 'database_connection'
  require_relative 'database_connection_setup'

attr_reader :username, :name, :email, :password

  def initialize(username:, name:, email:, password:)
    
    @username = username
    @name = name
    @email = email
    @password = password

  end

  def self.add(username:, name:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO \"user\" (name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING name, username, email, password;")
    User.new(username: result[0]['username'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.find(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM \"user\" WHERE username = '#{username}';")
    User.new(username: result[0]['username'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.authorize?(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM \"user\" WHERE username = '#{username}';")
    return true if result.any? && password == result[0]['password']
  end


end
