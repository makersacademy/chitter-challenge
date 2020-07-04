require 'pg'

class User
  attr_reader :username, :password, :email

  @user_id = 0

  def self.all
    database_selector
    result = @connection.exec( "SELECT * FROM account" )
    p result
    result.map { |account| User.new(account['username'],account['password'],account['email']) }
  end

  def self.check(email,password) #checks to see if password exists
    database_selector
    results = @connection.exec( "SELECT user_id FROM account
    WHERE email = '#{email}' AND  password = '#{password}';" )
    results.each do |result|
      @user_id = result["user_id"].to_i
   end
   @user_id > 0
  end

  def self.access
    database_selector
    result = @connection.exec( "SELECT * FROM account
    WHERE user_id = '#{@user_id}';" )
    result.map { |account| User.new(account['username'],account['password'],account['email']) }
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