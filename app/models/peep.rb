
class Peep
  include DataMapper::Resource

  property :id,   Serial
  property :peep, Text, required: true
  property :time, String

  belongs_to :user, :required => false

end
