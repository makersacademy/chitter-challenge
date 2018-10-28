require 'pg'

class User

  @conn = nil
  attr_reader :name, :username, :email, :password

  def self.create(details)
    find_db
    @conn.exec("INSERT INTO users(name, username, email, password)
    VALUES('#{details[:name]}', '#{details[:username]}', '#{details[:email]}', '#{details[:password]}');")
  end

  def self.all
    find_db
    @conn.exec("SELECT * FROM users").map do |user|
      User.new(name: user['name'], username: user['username'], email: user['email'], password: user['password'])
    end
  end

  def self.exists?(username, email)
    find_db
    @conn.exec("SELECT * FROM users WHERE(username = '#{username}') OR (email = '#{email}');").map do |user|
      return true
    end
    false
  end

  def self.login(email, password)
    find_db
    @conn.exec("SELECT * FROM users WHERE(email = '#{email}') AND (password = '#{password}');").map do |user|
      return user['username']
    end
    false
  end

  def self.find_db
    if ENV['RACK_ENV'] == 'test'
      @conn = PG.connect(dbname: 'chitter_test')
    else
      @conn = PG.connect(dbname: 'chitter')
    end
  end

  def initialize(details)
    @name = details[:name]
    @username = details[:username]
    @email = details[:email]
    @password = details[:password]
  end
end
