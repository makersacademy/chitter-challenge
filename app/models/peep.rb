class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :time, String
  property :peeper, String

  has 1, :user, {:through=>DataMapper::Resource}

end
