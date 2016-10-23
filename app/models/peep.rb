class Peep

  include DataMapper::Resource

  belongs_to :user

  property(:id, Serial)
  property(:text, String, length: 140, required: true)
  property(:timestamp, DateTime, required: true)

end
