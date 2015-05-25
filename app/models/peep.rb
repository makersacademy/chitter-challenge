class Peep

  include DataMapper::Resource
  
  belongs_to :user 

  property :id, Serial
  property :message, String
  property :time, Time


end