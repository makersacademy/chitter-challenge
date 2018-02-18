class Peep

  attr_reader :message, :message_time

  def initialize(message, message_time)
    @message = message
    @message_time = message_time
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result.map { |peep| Peep.new(peep['message'], peep['message_time']) }
  end

  def self.add(message)
    result = DatabaseConnection.query("INSERT INTO peeps VALUES('#{message}') returning message_time")
    p result[0]['message_time']
  end
end
