class Peep

  attr_reader :id, :poster, :time, :content

  def initialize(id, poster, time, content)
    @id = id
    @poster = poster
    @time = time
    @content = content
  end

end
