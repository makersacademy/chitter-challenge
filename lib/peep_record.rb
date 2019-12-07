class PeepRecord
  def initialize
    @peeps = []
  end

  def new_peep message
    @peeps << message
  end

  def all
    @peeps
  end
end
