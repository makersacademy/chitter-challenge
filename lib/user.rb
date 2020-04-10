class User
  attr_reader :username, :password, :email_address
  def initialize(name: , pw: , email: )
    @username = name
    @password = pw
    @email_address = email
  end
  def self.connect
    if ENV['RACK_ENV'] == 'test'
      @con = PG.connect :dbname => 'chitter_test', :user => 'edwardphillips'
    else 
      @con = PG.connect :dbname => 'chitter', :user => 'edwardphillips'
    end
  end
end