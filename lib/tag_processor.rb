module TagProcessor

  def hashtag_regex
    /(?:|^)(?:#(?!(?:\d+|\w+?_|_\w+?)(?:\s|$)))(\w+)(?=\s|$|,|\.|\?)/i
  end

  def tags_created
    self.content.scan(hashtag_regex).flatten
  end

  def save_tags
    tags_created.each do |tag|
      tag = Tag.first_or_create(name: tag)
      tags << tag
      self.save
    end
  end

  def content_with_tags
    output = self.content.gsub(hashtag_regex) do |tag|
      "<a href=/search/tags?tag=#{tag[1..-1]}>#{tag}</a>"
    end
    output
  end

end