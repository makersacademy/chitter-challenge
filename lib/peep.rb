require_relative 'database_connection'

class Peep

  attr_reader :time, :peep, :username

  def initialize(peep = 'peep', time = 'time', username = 'username')
    @peep = peep
    @time = time
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |row| Peep.new(row['peep'], row['time'], row['username']) }
  end

  def self.post_peep(peep, username)
    result = DatabaseConnection.query("INSERT INTO peeps VALUES('#{peep}', '#{Time.now.asctime}', '#{username}')")
  end

end
