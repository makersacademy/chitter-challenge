class Message
  attr_reader :content, :id, :time, :username

  def initialize(content, username, time = Time.now, id = nil)
    @content = content
    @username = username
    @time = time
    @id = id
  end
end
