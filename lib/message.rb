class Message
  attr_reader :content, :id

  def initialize(content, id = nil)
    @content = content
    @id = id
  end
end
