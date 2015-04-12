require './lib/tag_processor'

class Reply

  include DataMapper::Resource
  include TagProcessor

  property :id, Serial
  property :content, Text
  property :created_at, Time

  belongs_to :user
  belongs_to :note
  has n, :tags, through: Resource

end