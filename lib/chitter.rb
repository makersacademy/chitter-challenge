class Chitter

  attr_reader :peeps

  def initialize
    @peeps = []
  end

  def add_message(message)
    @peeps << message
  end
end
