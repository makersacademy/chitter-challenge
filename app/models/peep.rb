class Peep

  include DataMapper::Resource

  property :id,         Serial
  property :message,    Text,     :required => true, :length => 140
  property :timestamp,  String

  belongs_to :user

end
