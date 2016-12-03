require 'time'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :post_time, DateTime
  belongs_to :user

  def initialize params
    self.content = params[:content]
    self.post_time = Time.now
  end

end
