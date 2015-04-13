require './lib/tag_processor'

class Note

  include DataMapper::Resource
  include TagProcessor

  property :id,         Serial
  property :content,    Text
  property :created_at, Time
  property :updated_at, Time

  belongs_to :user
  has n, :replies, through: Resource
  has n, :tags, through: Resource

  def replies?
    !@replies
  end

end