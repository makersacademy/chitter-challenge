class Peep

  attr_reader :content

  def initialize(content)
    @content = content
  end

  def self.all
    [
      "Hello World!",
      "This breakfast is amazing!"
    ]
  end
end
