require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, required: true
  property :created_at, DateTime
  belongs_to :user, 'User', child_key: ['poster_id']
  has n, :mentions
  has n, :users_mentioned, 'User', through: :mentions, via: :user

  def handles(content)
    strings_preceded_by(content, '@')
  end

  def hashtags(content)
    strings_preceded_by(content, '#')
  end

  private

  def strings_preceded_by(content, character)
    content.scan(Regexp.new("#{character}[A-Za-z_\-]+"))
  end  

  def find_users(content)
    handles(content).map { |h| User.first(handle: h[1..-1]) }
  end

  def find_tags(content)
    tags(content).map { |t| Tag.first(name: t[1..-1]) }
  end

end
