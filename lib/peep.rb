require 'pg'

class Peep

  attr_reader :text, :time, :user

  def initialize(text, time, user)
    @text = text
    @time = time
    @user = user
  end

  def self.all
    rs = sql_query("SELECT text, time, username FROM peeps ORDER BY time DESC")

    rs.map { |peep| Peep.new(peep['text'], peep['time'], peep['username']) }
  end

  def self.create(text, user)
    sql_query("INSERT INTO peeps (text, time, username) VALUES ('#{text}', '#{Time.now}', '#{user}')")
  end

  def self.sql_query(string)
    connection.exec(string)
  end

  def self.connection
    return PG.connect :dbname => 'chitter_test' if ENV['RACK_ENV'] == 'test'

    return PG.connect :dbname => 'chitter'
  end

end
