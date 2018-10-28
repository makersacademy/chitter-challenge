require 'pg'

class User

  @conn = nil
  attr_reader :name, :username, :email, :password

  def self.create(details)
    find_db
    @conn.exec("INSERT INTO users(name, username, email, password)
    VALUES('#{details[:name]}', '#{details[:username]}', '#{details[:email]}', '#{details[:password]}');")
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
