class Message
  attr_reader :id, :message, :timestamp

  def initialize(id, message, timestamp)
    @id = id
    @message = message
    @timestamp = timestamp
  end
end
