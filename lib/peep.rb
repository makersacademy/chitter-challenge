class Peep
  attr_reader :username, :time, :text, :name

  def initialize(name, username, time, text)
    @name = name
    @username = username
    @time = time
    @text = text
  end
end
