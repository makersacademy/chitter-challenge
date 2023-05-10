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

  def format_user(user)
    str = "
    <h2>#{user.username}</h2>
    <div>#{user.name}, #{user.email}</div>
    <br/>
    "
  end
end
