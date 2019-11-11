require_relative 'peep'

class Feed

  attr_reader :peeps

  def initialize
    @peeps = []
  end

  def add_peep(peep)
    @peeps << peep
  end

end
