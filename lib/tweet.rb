require 'date'

class Tweet
  attr_reader :time, :content

  def initialize(content)
    @time = Time.new
    @content = content
  end

end