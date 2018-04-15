require 'pg'
require_relative 'users'

class Peeps

  def self.db_connect

    if ENV["RACK_ENV"] == 'test' then

      @@conn = PG.connect(dbname: 'chitter')

    else

      @@conn = PG.connect(dbname: 'chitter')

    end

  end

  def self.all

  Peeps.db_connect

    result = @@conn.exec('SELECT * FROM peeps')
    peeps = result.map{|peeps| peeps['message']}


  end

  def self.is_user?(user)
    usernames = User.all
    if usernames.include?(user)
      return true
    else
      return false
    end
  end

  def self.create(options)
    if Peeps.is_user?(options[:user]) then
      Peeps.db_connect
      @@conn.exec "INSERT INTO peeps (message, username) VALUES ('#{options[:peep]}', '#{options[:user]}')"
    end

  end

end
