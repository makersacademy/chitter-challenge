require 'pg'

class User

  attr_reader :logged_in

  def initialize(username, password, logged_in=false)

    @username = username
    @password = password
    @logged_in = logged_in

  end

  def self.all

    @users = []

    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end    
    users = con.exec "SELECT * FROM users"
    users.each do |row|
      @users << Peep.new(row['email_address'],row['password'],row['logged_in'])
    end
    return @users

    end

  def self.sign_up(username, password, is_logged_in)

    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end

    con.exec("INSERT INTO users(email_address, password, logged_in) VALUES('#{username}', '#{password}', '#{is_logged_in}')")

  end

end