class Peep
  attr_reader :username, :content, :post_time

  def initialize(username, content, post_time)
    @username = username
    @content = content
    @post_time = time_ago(post_time)
  end

  def time_ago(post_time)
    post_time
  end
end
