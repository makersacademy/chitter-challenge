require "pg"
require_relative "database_connection"

class Peep
  attr_reader :id, :msg, :time

  def initialize(id:, msg:, time:)
    @id = id
    @msg = msg
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep|
      Peep.new(
        id: peep["id"],
        msg: peep["msg"],
        time: peep["time"],
      )
    }
  end

  def self.create(msg:)
    return false unless is_in_char_limit(msg)
    result = DatabaseConnection.query("INSERT INTO peeps (msg, time) VALUES('#{msg}', '#{Time.now}') RETURNING id, msg, time;")
    Peep.new(id: result[0]["id"], msg: result[0]["msg"], time: result[0]["time"])
  end

  private

  def self.is_in_char_limit(msg)
    msg.length < 300
  end
end
