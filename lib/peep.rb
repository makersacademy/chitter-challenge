require_relative './database_connection'

class Peep
  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep|
      Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
    }
  end

  def self.post(message)
    time = Time.now
    result = DatabaseConnection.query("INSERT INTO peeps(message, time) VALUES
    ('#{message}', '#{time}') RETURNING id, message, time;")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
    end
  end
end
