class Message

  def self.add(message)
    @message = message
  end

  def self.view
    @message
  end
end