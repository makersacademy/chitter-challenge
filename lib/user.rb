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
      User.new(name: user['name'], username: user['username'], email: user['email'], password: user['password'] )
    end
  end

  def initialize(details)
    @name = details[:name]
    @username = details[:username]
    @email = details[:email]
    @password = details[:password]
  end

  private
  def self.find_db
    @conn = if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
  end
end
