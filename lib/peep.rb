class Peep
  attr_reader :id, :username, :posted_time, :content

  def initialize(id, username, posted_time, content)
    @id = id
    @posted_time = posted_time # can I change the format of time here?
    @content = content
    @username = username
  end

end
