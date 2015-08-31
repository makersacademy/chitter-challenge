class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String, required: true
  property :time, DateTime

  validates_presence_of :message

  belongs_to :user
end
