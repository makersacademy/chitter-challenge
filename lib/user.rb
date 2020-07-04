require 'pg'

class User
  attr_reader :username, :password, :email

  def self.all
    database_selector
    result = @connection.exec( "SELECT * FROM account" )
    p result
    result.map { |account| User.new(account['username'],account['password'],account['email']) }
  end

  def self.check #checks to see if password exists
    true
  end

  def initialize(username,password,email)
    @username = username
    @password = password
    @email = email
  end

  private
  def self.database_selector
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect( dbname: 'chitter' )
    end
  end


end