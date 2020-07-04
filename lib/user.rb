require 'pg'

class User
  attr_reader :username, :password, :email

  def self.all
    database_selector
    result = @connection.exec( "SELECT * FROM account" )
    p result
    result.map { |account| User.new(account['username'],account['password'],account['email']) }
  end

  def self.check(email,password) #checks to see if password exists
    database_selector
    @result = 0
    results = @connection.exec( "SELECT user_id FROM account
    WHERE email = '#{email}' AND  password = '#{password}';" )
    results.each do |result|
      @result = result["user_id"].to_i
   end
   @result > 0
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