class Peep
  attr_accessor :id, :content, :time, :user_id, :tags

  def content=(str)
    @content = str
    @tags = find_tags(str)
  end

  private

  def find_tags(content)
    content_arr = content.split
    content_arr.select{ |string|
      string[0] == '@' && string != '@'
    }.uniq
  end
end