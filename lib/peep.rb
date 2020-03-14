class Peep

  attr_reader :id, :peep, :post_time

  def initialize(id:, peep:, post_time:)
    @id = id
    @peep = peep
    @post_time = post_time
  end
end
