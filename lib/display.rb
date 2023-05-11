require_relative 'peep_repository'
require_relative 'user_repository'

class Display
  def peep(peep)
    content = content_with_links(peep)
    str = "
    #{peep.name} (#{link(peep.username)}) says:<br/>
    #{content}<br/>
    - #{peep.time}
    <br/>
    "
  end

  def user(user)
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

  def tag_to_link(tag)
    return tag unless username_exists?(tag[1..])
    username = tag[1..]
    return link(username)
  end

  def content_with_links(peep)
    content = peep.content
    peep.tags.each do |tag|
      content.gsub!(tag, tag_to_link(tag))
    end
    return content
  end

  def username_exists?(username)
    repo = UserRepository.new
    usernames = repo.all.map { |user| user.username }
    return usernames.include?(username)
  end
end
