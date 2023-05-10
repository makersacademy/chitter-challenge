require_relative 'peep_repository'
require_relative 'user_repository'

class Formatter
  def format_peep(peep)
    str = "
    #{peep.name} (#{link(peep.username)}) says:<br/>
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

  private

  # returns an html link to the user's page
  def link(username)
    repo = UserRepository.new
    user = repo.all.select { |user| user.username == username }[0]
    id = user.id
    str = "<a href='users/#{id}'>#{username}</a>"
  end
end
