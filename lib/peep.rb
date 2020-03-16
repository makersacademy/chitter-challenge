class Peep

  attr_reader :peep_id, :peep, :post_time, :post_date

  def initialize(peep_id:, peep:, post_time:, post_date:)
    @peep_id = peep_id
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
