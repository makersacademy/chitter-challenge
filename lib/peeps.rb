class Peeps

  attr_reader :messages

  def initialize
    @messages = []
  end

  def self.create
    @peeps = Peeps.new
  end

  def self.instance
    @peeps
  end
  
  def add(peep)
    @messages << peep
  end

end
