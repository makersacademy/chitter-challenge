require 'data_mapper'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  def time_created
    created_at.strftime('%a, %d %b %Y, %H:%M:%S')
  end

  def display
    content
  end

  belongs_to :user, required: false

end
