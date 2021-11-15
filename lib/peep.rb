class Peep

  attr_reader :name, :username, :content
  
  def initialize(name, username, content)
    @name = name
    @username = username
    @content = content
  end

  def self.all
    [self.new("jon","jj123","Hello"), self.new("Mia","mnms1","Hi, it's Mia")]
  end
end