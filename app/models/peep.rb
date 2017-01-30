class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  validates_length_of :content, :max => 100

  belongs_to :user, :required => true

end
