class Peep
  include DataMapper::Resource

  belongs_to(:user)

  property(:id, Serial)
  property(:text, String, required: true, length: 140)
  property(:timestamp, DateTime, required: true)
end
