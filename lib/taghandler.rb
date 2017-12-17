require './app/data_mapper_setup.rb'

module TagHandler

  def find_tag(message)
    message.content.split(' ').select { |word| word[0] == '@' }
  end

  def check_tag_against_user(tag_string)
    User.first(username: tag_string[1..-1])
  end

  def create_tag(user, message)
    Tag.create(user_id: user.id, message_id: message.id)
  end

  def tags(message)
    return nil if find_tag(message).empty?
    user = check_tag_against_user(find_tag(message)[0])
    user ? create_tag(user, message) : nil
  end

end
