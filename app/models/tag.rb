class Tag < ActiveRecord::Base
  def self.check(peep)
    return nil unless peep.content.include?('@')
    
    content = peep.content.scan(/@\S+\b/)

    content.map! do |tag|
      user = User.find_by(handle: tag)
      next unless user

      Tag.create(user_id: user.id, peep_id: peep.id, tagger_id: peep.user.id)
    end
    content == [nil] ? nil : content
  end

  def self.user_tags(user_id)
    unread = Tag.where(user_id: user_id, read: nil).map { |tag| tag }
    read = Tag.where(user_id: user_id, read: true).map { |tag| tag }
    { unread: unread, read: read }
  end

  # instance methods

  def read!
    ActiveRecord::Base.connection.execute("UPDATE tags SET read = true WHERE id = #{self.id}")
  end

  def peep
    Peep.find_by_id(peep_id)
  end
end