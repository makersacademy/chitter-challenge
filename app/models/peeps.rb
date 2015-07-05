
class Peeps

  include DataMapper::Resource

  property :id, Serial
  property :activity, String
  property :created_at, DateTime


end


