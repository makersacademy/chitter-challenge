class Peep

  attr_reader :content

  def initialize(content:)
    @content = content
  end 

  def self.create(content:)
    Peep.new(
      content: content)
  end 
end 