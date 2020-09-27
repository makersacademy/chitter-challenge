class Message
  attr_reader :content, :id, :time

  def initialize(content, time = Time.now, id = nil)
    @content = content
    @time = time
    @id = id
  end
end
