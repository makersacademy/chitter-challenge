class Peep
  attr_reader :id, :peep, :time
  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end
end
