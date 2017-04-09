class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep, Text, :required => true
  property :created_at, DateTime


  belongs_to :user, :required => true

end
