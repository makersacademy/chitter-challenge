require 'pg'

class Peep
  attr_reader :peep_text

  def initialize(peep_content)
    @peep_text = peep_content
  end

  def self.create(peep_content)
    Peep.new(peep_content)
  end
end
