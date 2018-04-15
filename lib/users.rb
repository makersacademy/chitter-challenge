require 'pg'
class User
  attr_reader :username

  def self.db_connect

    if ENV["RACK_ENV"] == 'test' then

      @@conn = PG.connect(dbname: 'chitter')

    else

      @@conn = PG.connect(dbname: 'chitter')

    end

  end

  def initialize(name)

    @username = name


  end

  def self.all
    User.db_connect
    usernames = @@conn.exec('SELECT * from users').map{ |users| users['username']}


  end

  def self.create(options)
    User.db_connect
    @@conn.exec("INSERT INTO users (email, username, password, name) VALUES ('#{options[:email]}', '#{options[:username]}', '#{options[:password]}', '#{options[:name]}')")

  end

end
