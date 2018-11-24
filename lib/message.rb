class Message

  def self.add(message)
    @message = message
  end

  def self.all
    @message
  end
end