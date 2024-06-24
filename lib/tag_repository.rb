require_relative "./tag"
require_relative "./user_repository"
require "pony"


class TagRepository
  def all
    sql = "SELECT * FROM tags;"
    result_set = DatabaseConnection.exec_params(sql, [])

    tags = []

    result_set.each do |row|
      tag = Tag.new
      tag.peep_id = row["peep_id"].to_i
      tag.user_id = row["user_id"].to_i
      tags << tag
    end

    return tags
  end

  def add(tag)
    sql = "INSERT INTO tags (peep_id, user_id) VALUES ($1, $2);"
    params = [tag.peep_id, tag.user_id]

    DatabaseConnection.exec_params(sql, params)

    return nil
  end

  def check_message_for_tags(message)
    # scan returns an array of all strings like '@sometext'
    possible_tags = message.scan(/@\w+(?=[^\w]||$)/)

    # returns an array of user_id's for all matching users
    tagged_users = UserRepository.new.check_for_matching(possible_tags)

    return nil if tagged_users.empty?

    return tagged_users
  end

  def add_tags_by_peep(tagged_users, peep_id)
    tagged_users.each do |user|
      tag = Tag.new
      tag.peep_id = peep_id
      tag.user_id = user.id
      # Instead of this, INSERT multiple rows at once?
      add(tag)
      send_email_confirmation(peep_id, user)
    end
  end

  def send_email_confirmation(peep_id, user)
    # use to gem to send email confirmation
    Pony.mail(
      :to => "#{user.email}",
      :html_body => "Hey @#{user.username}, you were just tagged in a peep! <a href='/peeps/#{peep_id}'>Click here to check it out</a>"
    )
  end

end
