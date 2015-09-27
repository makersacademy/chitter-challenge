class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text, :length => 140
  belongs_to :user

end
