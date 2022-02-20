class Peep 
  attr_reader :peeps

  def initialize
    @peeps = []
  end

  def new_peep(name, username, message)
    peep = [name, username, message]
    @peeps << peep
  end
end
