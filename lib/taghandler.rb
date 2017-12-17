require './app/data_mapper_setup.rb'

module TagHandler

  def find_tag(peep)
    peep.content.split(' ').select { |word| word[0] == '@' }
  end

  def check_tag_against_user(tag_arr)
    tag_arr.map { |tag_string| User.first(username: tag_string[1..-1]) }
  end

  def create_tag(users, peep)
    users.each { |user| Tag.create(user_id: user.id, peep_id: peep.id) }
  end

  def tags(peep)
    return nil if find_tag(peep).empty?
    user = check_tag_against_user(find_tag(peep))
    user ? create_tag(user, peep) : nil
  end

end
