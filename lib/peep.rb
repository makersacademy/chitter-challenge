class Peep

  attr_reader :id, :peep, :post_time, :post_date

  def initialize(id:, peep:, post_time:, post_date:)
    @id = id
    @peep = peep
    @post_time = post_time
    @post_date = post_date
  end

  def self.time
    @post_time = Time.now.strftime('%H:%M')
  end

  def self.date
    @self_date = Date.today
  end
end
