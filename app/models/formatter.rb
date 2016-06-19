class Formatter
  class << self
    def linkify(text)
      @text = text
      linkify_urls
      linkify_hashtags_and_usernames
      @text.strip.squeeze(" ")
    end

    def extract_hashtags(peep)
      peep.text.gsub(/\#\w+/) do |text|
        hashtag = Hashtag.first_or_create(name: text[1..text.size])
        HashtagPeep.create(hashtag: hashtag, peep: peep)
      end
    end

    private

    def linkify_urls
      @text.gsub!(/http\S+/) do |text|
        " <a href=\"#{ text }\" target=\"_blank\">#{ text }</a> "
      end
    end

    def linkify_hashtags_and_usernames
      @text.gsub!(/(\#|\@)\w+/) do |text|
        " <a href=\"/#{ text[0] == "#" ? "hashtag/" : "user/profile/" }"\
        "#{ text[1..text.size] }\">#{ text }</a> "
      end
    end
  end
end
