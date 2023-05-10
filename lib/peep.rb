class Peep
  attr_accessor :id, :content, :time, :user_id, :tags,
                :username, :name

  def content=(str)
    @content = str
    @tags = find_tags(str)
  end

  private

  def find_tags(content)
    content_arr = content.split
    content_arr.select do |string|
      string[0] == '@' && string != '@'
    end.uniq
  end
end
