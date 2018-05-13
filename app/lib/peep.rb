class Peep
  attr_reader :id, :author, :message, :timestamp

  def initialize(id, user_id, peep, timestamp)
    @id = id
    @author = user_id
    @message = peep
    @timestamp = timestamp
  end
end
