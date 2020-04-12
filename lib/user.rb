require 'pg'

class User
  attr_reader :username, :password, :email_address, :id

  def initialize(name: , pw: , email: , user_id: nil)
    @username = name
    @password = pw
    @email_address = email
    @id = user_id
  end

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      @con = PG.connect :dbname => 'chitter_test', :user => 'edwardphillips'
    else 
      @con = PG.connect :dbname => 'chitter', :user => 'edwardphillips'
    end
  end

  def self.create(usr:, pass:, email:)
    self.connect
    @con.exec("INSERT INTO users (username, password, email) VALUES ('#{usr}', '#{pass}', '#{email}')")
  end

  def self.all
    self.connect
    rs = @con.exec "SELECT * FROM users"
    rs.map { |row| User.new(name: row['username'], pw: row['password'], email: row['email'], user_id: row['id'])}    
  end

  def self.authenticate(username:, pw:)
    self.connect
    res = @con.exec("SELECT * FROM users WHERE username = '#{username}' AND password = '#{pw}'")
    res.any?
  end

end