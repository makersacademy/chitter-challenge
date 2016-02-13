
class Response

  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :post_time, DateTime

  belongs_to :peep
  belongs_to :user

  def format_time
    self.post_time.strftime("%d %B %Y, at %H:%M")
  end

end
