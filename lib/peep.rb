class Peep
  attr_reader :peep
  def self.create(peep)
    @peep = Peep.new(peep)
  end

  def self.get
    @peep
  end

  def initialize(peep)
    @peep = peep
  end

end
