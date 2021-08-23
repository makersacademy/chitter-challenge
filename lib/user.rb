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

  def self.fetch(email, password)
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
      @results = @connection.exec( "SELECT * FROM users WHERE email = '#{email}' AND password = '#{password}'" )
      if @results.values.empty?
        return nil
      else
        @user = User.new(@results.values[0][3], @results.values[0][1], @results.values[0][4], @results.values[0][2])
      end
  end

  def self.instance
    @user
  end
end