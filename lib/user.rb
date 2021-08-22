require 'pg'

class User

  attr_reader :name, :email, :username, :password

  def initialize(name, email, username, password)
    @name = name
    @email = email
    @username = username
    @password = password
  end

  def self.create(name, email, username, password)
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
    @connection.exec( "INSERT INTO users(name, email, username, password) 
      VALUES('#{name}', '#{email}', '#{username}', '#{password}') 
      RETURNING id, name, email, username, password;" )
      @user = User.new(name, email, username, password)
  end

  def self.instance
    @user
  end
end