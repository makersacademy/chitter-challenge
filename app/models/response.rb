class Response

  include DataMapper::Resource

  belongs_to :user
  belongs_to :peep

  property(:id, Serial)
  property(:text, String, length: 140, required: true)
  property(:timestamp, DateTime, required: true)

end
