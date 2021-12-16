
class Chitter
  
  attr_reader :peep_log

  def initialize
    @peep_log = []
  end

  def peep_history
    @peep_log.reverse.map { |peep| "Time: #{peep.time.strftime("%k:%M")}  Message: #{peep.message}" }
  end

end