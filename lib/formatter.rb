require_relative 'peep_repository'
require_relative 'user_repository'

class Formatter
  def format_peep(peep)
    user_repo = UserRepository.new
    user = user_repo.find(peep.user_id)
    name = user.name
    username = user.username
    str = "
    #{name} (#{username}) says:<br/>
    #{peep.content}<br/>
    - #{peep.time}
    "
  end
end
