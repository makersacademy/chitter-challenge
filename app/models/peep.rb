class Peep
  include DataMapper::Resource

  belongs_to(:user)

  property(:id, Serial)
  property(:text, String, length: 140, required: true)
  property(:timestamp, DateTime, required: true)

  def self.linkify(input_text)
    @input_text = input_text
    linkify_urls
    linkify_hashtags_and_usernames
    @input_text.strip.squeeze(" ")
  end

  private

  def self.linkify_urls
    @input_text.gsub!(/http\S+/) do |text|
      " <a href=\"#{ text }\" target=\"_blank\">#{ text }</a> "
    end
  end

  def self.linkify_hashtags_and_usernames
    @input_text.gsub!(/(\#|\@)\w+/) do |text|
      " <a href=\"http://twitter.com/#{ "hashtag/" if text[0] == "#" }"\
      "#{ text[1..text.size] }\" target=\"_blank\">#{ text }</a> "
    end
  end
end
