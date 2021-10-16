class AllMessages

  attr_reader :content

  def initialize 
    @content = []
  end

  def add_message(message)
    @content.append(message)
  end
  
end