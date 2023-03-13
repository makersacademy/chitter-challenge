class Peep
  attr_accessor :id, :time, :content, :user_id

  def self.get_tags(content)
    tags = content.scan(/@\w+/)
    username_list = tags.map! { |tag| tag.slice(1..-1) }
    return username_list
  end
end
