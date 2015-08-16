class Peep

  include DataMapper::Resource

  belongs_to :user
  
  property :id, Serial
  property :handle, String
  property :message,  String
  property :time, String



end
