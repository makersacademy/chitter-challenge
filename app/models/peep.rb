require 'data_mapper'

class Peep
  include DataMapper::Resource
  attr_accessor :tags, :users

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
    pairs = handles(text).map { |h| [h, User.first(handle: h[1..-1])] }
    @users = Hash[pairs]
  end

  def content=(text)
    find_users(text)
    return if users.select { |k, v| v.nil? }.count > 0
    users.each do |k, v| 
      Mention.new(user_id: v.id, peep_id: self.id)
      text = text.gsub(k, v.to_html)
    end
    super text
  end

  private

  def strings_preceded_by(content, character)
    content.scan(Regexp.new("#{character}[A-Za-z_\-]+"))
  end  
end
