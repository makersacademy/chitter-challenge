
class Peep

  include DataMapper::Resource

  property :id, Serial
  property :activity, String
  property :created_at, DateTime

  belongs_to :user
  
end


