class Peep 

  attr_reader :name, :handle, :peep, :timestamp

  def initialize(name:, handle:, peep:, timestamp:)
    @name = name
    @handle = handle
    @peep = peep
    @timestamp = timestamp
  end

  def self.create(name:, handle:, peep:, timestamp:)
    Peep.new(name: name, handle: handle, peep: peep, timestamp: timestamp)
  end

end