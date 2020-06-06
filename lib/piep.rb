require 'pg'

class Piep

  attr_reader :text, :time, :user

  def initialize(text, time, user)
    @text = text
    @time = time
    @user = user
  end

  def self.all
    rs = sql_query("SELECT text, time, username FROM piepjes ORDER BY time DESC")

    rs.map { |piepje| Piep.new(piepje['text'], piepje['time'], piepje['username']) }
  end

  def self.create(text, user)
    sql_query("INSERT INTO piepjes (text, time, username)
      VALUES ('#{text}', '#{Time.now}', '#{user}')")
  end

  def self.sql_query(string)
    connection.exec(string)
  end

  def self.connection
    return PG.connect :dbname => 'chitter_test' if ENV['RACK_ENV'] == 'test'

    return PG.connect :dbname => 'chitter'
  end

end
