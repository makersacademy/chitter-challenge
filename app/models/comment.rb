class Comment

  include DataMapper::Resource

  property :id, Serial
  property :text, Text, required: true
  property :time, Time

  belongs_to :peep
  belongs_to :maker

end
