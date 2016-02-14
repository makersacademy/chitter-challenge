require 'dm-validations'

class Reply
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :time, Time

  belongs_to :peep
  belongs_to :user
end
