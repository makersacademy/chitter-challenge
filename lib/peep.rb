
require_relative 'database_connection'

class Peep
  attr_reader :username, :userhandle, :peep, :time

  def initialize(username, userhandle, peep, time)
    @username = username
    @userhandle = userhandle
    @peep = peep
    @time = Time.new.to_s
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY time DESC")
    result.map { |peep| Peep.new(peep['username'], peep['userhandle'], peep['peep'], peep['time']) }
  end

  def self.create(username, userhandle, peep)
    DatabaseConnection.query("INSERT INTO peeps (username, userhandle, peep, time) VALUES('#{username}', '#{userhandle}', '#{peep}', '#{Time.now}'")
  end
end
