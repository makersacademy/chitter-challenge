class Peep
  attr_reader :id, :text, :time, :username
  def initialize(id:, text:, time:, username: 'anonymous')
    @id = id
    @text = text
    @time = time
    @username = username
  end
end
