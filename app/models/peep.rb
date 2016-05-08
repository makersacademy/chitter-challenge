class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id,        Serial
  property :peep,      String
  property :time,      String
  property :author,  String
  property :handle, String

end
