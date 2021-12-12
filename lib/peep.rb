require 'pg'

class Peep

  attr_reader :message

  def initialize(message)
    @message = message
  end        

  def self.post(message)
    Peep.new(message)
  end
end
