class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String, length: 150, required: true
  property :datetime, DateTime

  belongs_to :user
  has n, :replys
end
