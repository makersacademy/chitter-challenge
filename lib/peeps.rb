class Peeps

  def self.create(message:)
    Peeps.new(message)
  end

  attr_reader :message

  def initialize(message)
    @message = message
  end
end
