require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, required: true
  property :created_at, DateTime
  belongs_to :user, 'User', child_key: ['poster_id']
  has n, :mentions
  has n, :users_mentioned, 'User', through: :mentions, via: :user

  def handles(text)
    strings_preceded_by(text, '@')
  end

  def hashtags(text)
    strings_preceded_by(text, '#')
  end

  def find_users(text)
    handles(text).map { |h| User.first(handle: h[1..-1]) }
  end

  def find_tags(text)
    tags(text).map { |t| Tag.first(name: t[1..-1]) }
  end

  def content=(text)
    users = find_users(text)
    return if users.select(&:nil?).count > 0
    users.each { |u| Mention.new(user_id: u.id, peep_id: self.id) }
    super text
  end
  
  private

  def strings_preceded_by(content, character)
    content.scan(Regexp.new("#{character}[A-Za-z_\-]+"))
  end  
end
