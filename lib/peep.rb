class Peep
  attr_reader :id, :body

  def initialize(id, body)
    @id = id
    @body = body
  end

  def self.all
    'I have eaten way too many brownies! Help!'
  end

end
