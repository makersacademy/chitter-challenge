class Chitter < Sinatra::Base
  def create_tag(user)
    Tag.create(tag_name: "@#{user.username}", user_id: user.id)
  end

  def check_for_tags(content)
    tags = content.scan(/[$|\s](@[^\s]*)+/)
    return unless tags
    tags.each { |tag| Tag.first_or_create(tag_name: tag.join) unless check_for_mentions(tag) }
  end
end
