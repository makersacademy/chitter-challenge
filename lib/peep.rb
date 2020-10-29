require 'pg'
require 'database_connection'

class Peep

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY time DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
    end
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}')
    RETURNING id, message, time;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], time: result[0]['time'])
  end
end
