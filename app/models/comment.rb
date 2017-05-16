require 'data_mapper'

class Comment
  include DataMapper::Resource

  property :id, Serial
  property :body, String, required: true
  property :timestamp, String # Is timestamp also required?

  belongs_to :peep
  belongs_to :user
end
