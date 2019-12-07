class Peep
  attr_reader :body, :likes, :timestamp
  
  def initialize body, likes = 0, timestamp = Time.now.utc.strftime('%k:%M')
    @body = body
    @likes = likes
    @timestamp = timestamp
  end

  def like
    @likes += 1
  end
end
