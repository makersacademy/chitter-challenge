
class Peep

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def self.all
    [Peep.new('peep1'), Peep.new('peep2')]
  end

end
