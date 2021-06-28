require_relative 'chitter'

class Peep
 
  def self.create(peep:)
    Chitter.add(peep: peep)
    Peep.new(peep: peep)
  end

  attr_reader :peep

  def initialize(peep:)
    @peep = peep
  end

end