require_relative 'database_connection'

class Peep

attr_reader :message, :time

def initialize(id:, message:, time:)
  @id = id
  @message = message
  @time = time
end

def self.create(message:, time:)
  peep = DatabaseConnection.query("INSERT INTO peeps (message, time)
  VALUES ('#{message}', '#{time}')
  RETURNING id, message, time;")
Peep.new(
  id: peep[0]['id'],
  message: peep[0]['message'],
  time: peep[0]['time']
)
end

def self.all
  peeps = DatabaseConnection.query('SELECT * FROM peeps;')
  peeps.map do |peep|
  Peep.new(
    id: peep['id'],
    message: peep['message'],
    time: peep['time']
  )
end
end

end
