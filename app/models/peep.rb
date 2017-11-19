require 'data_mapper'
require_relative 'tag'

class Peep
  include DataMapper::Resource
  attr_accessor :users

  property :id, Serial
  property :content, Text, required: true
  property :created_at, DateTime
  belongs_to :user, 'User', child_key: ['poster_id']
  has n, :mentions
  has n, :tags, through: Resource
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

  def find_tags(text)
    pairs = hashtags(text).map { |t| [t, Tag.first_or_create(name: t[1..-1])] }
    hash = Hash[pairs]
    hash.values.each { |tag| self.tags << tag }
    hash
  end

  def content=(text)
    find_users(text)
    hashtags = find_tags(text)
    return if users.select { |k, v| v.nil? }.count > 0
    users.each do |k, v| 
      Mention.new(user_id: v.id, peep_id: self.id)
      text = text.gsub(k, v.to_html)
    end
    hashtags.each do |k, v|
      p hashtags
      text = text.gsub(k, v.to_html)
    end
    super text
  end

  private

  def strings_preceded_by(content, character)
    content.scan(Regexp.new("#{character}[A-Za-z_\-]+"))
  end  
end
