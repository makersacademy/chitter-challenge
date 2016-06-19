class Peep
  include DataMapper::Resource

  belongs_to(:user)
  has(n, :hashtags, through: Resource)

  property(:id, Serial)
  property(:text, String, length: 140, required: true)
  property(:timestamp, DateTime, required: true)

  def self.extract_hashtags(peep)
    peep.text.gsub(/\#\w+/) do |text|
      hashtag = Hashtag.first_or_create(name: text[1..text.size])
      HashtagPeep.create(hashtag: hashtag, peep: peep)
    end
  end
end
