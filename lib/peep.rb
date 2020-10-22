class Peep
  attr_reader :username, :body, :time

  def initialize(username, body, time)
    @username = username
    @body = body 
    @time = time 
  end
end