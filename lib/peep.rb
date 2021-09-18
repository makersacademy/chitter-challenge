class Peep
  def initialize(content:)
    @content = content
  end

  def self.create(content:)
    Peep.new(content: content)
  end
end