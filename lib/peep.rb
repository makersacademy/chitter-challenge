class Peep
  attr_reader :username, :time, :text

  def initialize(username, time, text)
    @username = username
    @time = time
    @text = text
  end
end
