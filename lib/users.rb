require 'pg'

class Users

  attr_reader :name

  def initialize(name, email, password)
    @name = name
    @email = email
    @password = password
  end

  def self.create_user(name, email, password)
    if name.length > 0 && email.length > 0 && email.include?("@") && password.length > 4
      database_connection
      name = sanitize(name)
      email = sanitize(email)
      password = sanitize(password)
      @connection.exec("INSERT INTO users (username, email, password) VALUES ('#{name}', '#{email}', '#{password}');")
      Users.new(name, email, password)
    else
      raise 'username, email or password not valid'
    end
  end

private

  def self.sanitize(string)
    string.gsub(/'/, "&#39;").gsub(/"/, '&#34;')
  end
 
  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

end
