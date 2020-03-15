class Peep

  attr_reader :id, :peep, :post_time, :post_date

  def initialize(id:, peep:, post_time:, post_date:)
    @id = id
    @peep = peep
    @post_time = post_time
    @post_date = post_date
  end
end
