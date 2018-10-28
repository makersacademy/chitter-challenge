class Peep

attr_reader :message

def initialize(message)
  @message = message
end

def self.create(message)
  Peep.new(message)
end

end
