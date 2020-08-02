require 'pg'

class User
  attr_reader :username, :email, :user_session

  @@user_id = 0
  @user_session = 0

  def self.all
    database_selector
    result = @connection.exec( "SELECT * FROM account" )
    result.map { |account| User.new(account['username'],account['user_id'],account['password'],account['email']) }
  end

  def self.check(email,password) #checks to see if password exists
    database_selector
    results = @connection.exec( "SELECT user_id FROM account
    WHERE email = '#{email}' AND  password = '#{password}';" )
    results.each do |result|
      @@user_id = result["user_id"].to_i
   end
   @@user_id > 0
  end

  def self.access(user_id = @@user_id)
    database_selector
    result = @connection.exec( "SELECT * FROM account
    WHERE user_id = '#{user_id}';" )
    result.map { |account| @user_session = User.new(account['username'],account['user_id'],account['password'],account['email']) }
    @user_session
  end

  def initialize(username,userid, password,email)
    @username = username
    @password = password
    @email = email
    @userid= userid.to_i
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