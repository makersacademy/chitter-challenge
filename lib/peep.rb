class Peep

  attr_reader :message
  @@messages = []

  def initialize(message)
    @message = message
  end

  def self.create(messages)
    @@messages.push(
      peep = Peep.new(messages))
      peep
  end

  def self.all
    @@messages
  end

end
