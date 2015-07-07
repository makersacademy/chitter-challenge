class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :creation_time, Time

  belongs_to :user

end