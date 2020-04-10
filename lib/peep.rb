class Peep

  def initialize
    @peeps = []
  end
  
  attr_reader :peeps

  def create(peep)
    @peeps << peep
  end

end