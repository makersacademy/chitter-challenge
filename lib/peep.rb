class Peep

  attr_reader :author, :body, :time

  def initialize(author, body, time)
    @author = author
    @body = body
    @time = time
  end

end
