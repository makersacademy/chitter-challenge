require 'pg'

class Peep
  attr_reader :id, :username, :peep, :time

  def initialize(id:, username:, peep:, time:)
    @id = id
    @username = username
    @peep = peep
    @time = time
  end

  def self.all_peeps
    result = DatabaseConnection.query("SELECT id, username, peep, time
      FROM peeps ORDER BY time DESC")
    result.map do |peep|
      Peep.new(id: peep['id'],
        username: peep['username'],
        peep: peep['peep'],
        time: peep['time'])
    end
  end

  def self.new_peep(username:, peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (username, peep, time)
      VALUES('#{username}', '#{peep}', 'now()')
      RETURNING id, username, peep, time;")
    Peep.new(id: result[0]['id'],
      username: result[0]['username'],
      peep: result[0]['peep'],
      time: result[0]['time'])
  end
end