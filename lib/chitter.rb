class Chitter
  attr_reader :peeps

  def initialize
    @peeps = []
  end

  def post(peep)
    @peeps << Peep.new(time: Time.now, message: peep)
  end

  def list_peeps
    @peeps.reverse.map { |peep| "#{peep.time.strftime("%k:%M")} - #{peep.message}" }
  end
end