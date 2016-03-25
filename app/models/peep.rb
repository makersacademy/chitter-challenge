
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, :lazy => false
  property :creation_timedate, DateTime

  belongs_to :user

end
