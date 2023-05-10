require_relative 'peep_repository'
require_relative 'user_repository'

class Formatter
  def format_peep(peep)
    str = "
    #{peep.name} (#{peep.username}) says:<br/>
    #{peep.content}<br/>
    - #{peep.time}
    <br/>
    "
  end
end
