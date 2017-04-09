class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep, Text, :required => true

  belongs_to :user, :required => true

end
