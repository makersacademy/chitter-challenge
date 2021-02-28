class Peep
  attr_reader :id, :username, :posted_time, :content

  def initialize(id, username, posted_time, content)
    @id = id
    @posted_time = posted_time
    @content = content
    @username = username
  end

end
