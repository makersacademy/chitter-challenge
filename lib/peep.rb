
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
end