class Formatter
  class << self
    def linkify(input_text)
      @input_text = input_text
      linkify_urls
      linkify_hashtags_and_usernames
      @input_text.strip.squeeze(" ")
    end

    private

    def linkify_urls
      @input_text.gsub!(/http\S+/) do |text|
        " <a href=\"#{ text }\" target=\"_blank\">#{ text }</a> "
      end
    end

    def linkify_hashtags_and_usernames
      @input_text.gsub!(/(\#|\@)\w+/) do |text|
        " <a href=\"/#{ text[0] == "#" ? "hashtag/" : "user/profile/" }"\
        "#{ text[1..text.size] }\">#{ text }</a> "
      end
    end
  end
end
