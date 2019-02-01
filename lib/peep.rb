class Peep

  attr_reader :text

  def initialize(text:)
    @text = text
  end

  def self.create(text:)
    Peep.new(text: text)
  end

end